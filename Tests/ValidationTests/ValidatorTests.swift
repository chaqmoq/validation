@testable import Validation
import XCTest

final class ValidatorTests: XCTestCase {
    var validator: Validator!

    override func setUp() {
        super.setUp()

        validator = Validator()
    }

    func testEmptyValueAgainstImplicitConstraint() {
        // Arrange
        let value = ""

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value))
    }

    func testEmptyValueWithOneConstraint() {
        // Arrange
        let value = ""

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: NotBlankConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testValueWithMultipleConstraintTypesAndGroups() {
        // Arrange
        let value = "a"
        let groups: Set<Group> = ["custom"]

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value, against: [.notBlank(), .length(min: 1)], on: groups))
    }

    func testInvalidValueWithMultipleConstraintsAndValidationGroups() {
        // Arrange
        let value = "ab"
        let max: UInt = 1
        let groups: Set<Group> = ["custom"]

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(
            value,
            against: NotBlankConstraint(), LengthConstraint(max: max, groups: groups),
            on: groups
        )) { error in
            XCTAssertTrue(error is ConstraintViolation)
            XCTAssertEqual(error.localizedDescription, String(format: LengthConstraint.maxMessage, max))
        }
    }

    func testDictionaryAgainstConstraintTypes() {
        // Arrange
        let dictionary: [String: Any?] = [
            "firstName": "",
            "lastName": ""
        ]
        let constraints: [String: [ConstraintType]] = [
            "firstName": [.notBlank(), .length(min: 2)],
            "lastName": [.notBlank(), .length(min: 2)],
            "age": [.notBlank(), .integer(min: 16)]
        ]

        // Act
        let constraintViolations = validator.validate(dictionary, against: constraints)

        // Assert
        XCTAssertEqual(constraintViolations.count, 3)
        XCTAssertEqual(constraintViolations["firstName"]?.count, 2)
        XCTAssertEqual(constraintViolations["lastName"]?.count, 2)
        XCTAssertEqual(constraintViolations["age"]?.count, 2)
    }

    func testEncodableDataAgainstConstraintTypes() {
        // Arrange
        struct User: Encodable {
            var firstName: String
            var lastName: String
            var age: Int
        }

        let encodable = User(firstName: "S", lastName: "K", age: 15)
        let constraints: [String: [ConstraintType]] = [
            "firstName": [.notBlank(), .length(min: 2)],
            "lastName": [.notBlank(), .length(min: 2)],
            "age": [.notBlank(), .integer(min: 16)]
        ]

        // Act
        let constraintViolations = try! validator.validate(encodable, against: constraints)

        // Assert
        XCTAssertEqual(constraintViolations.count, 3)
        XCTAssertEqual(constraintViolations["firstName"]?.count, 1)
        XCTAssertEqual(constraintViolations["lastName"]?.count, 1)
        XCTAssertEqual(constraintViolations["age"]?.count, 1)
    }

    func testEncodableAndDictionaryAgainstConstraintTypesOnGroupSequence() {
        // Arrange
        struct User: Encodable {
            var email: String
            var username: String
            var password: String
        }

        let encodable = User(email: "", username: "", password: "")
        let dictionary: [String: Any?] = [
            "email": "s",
            "password": ""
        ]
        let min: UInt = 2
        let constraints: [String: [ConstraintType]] = [
            "email": [.notBlank(groups: ["first"]), .length(min: min, groups: ["first"]), .email(groups: ["second"])],
            "username": [.notBlank(groups: ["first"])],
            "password": [.notBlank(groups: ["first"]), .length(min: min, groups: ["second"])]
        ]

        // Act
        var constraintViolations = try! validator.validate(
            encodable,
            against: constraints,
            on: GroupSequence(["first", "second"])
        )

        // Assert
        XCTAssertEqual(constraintViolations.count, 3)
        XCTAssertEqual(constraintViolations["email"]?.count, 2)
        XCTAssertEqual(constraintViolations["email"]?.first?.message, NotBlankConstraint.message)
        XCTAssertEqual(
            constraintViolations["email"]?.last?.message,
            String(format: LengthConstraint.minMessage, min)
        )
        XCTAssertEqual(constraintViolations["username"]?.count, 1)
        XCTAssertEqual(constraintViolations["username"]?.first?.message, NotBlankConstraint.message)
        XCTAssertEqual(constraintViolations["password"]?.count, 1)
        XCTAssertEqual(constraintViolations["password"]?.first?.message, NotBlankConstraint.message)

        // Act
        constraintViolations = try! validator.validate(
            encodable,
            against: constraints,
            on: GroupSequence(["second", "first"])
        )

        // Assert
        XCTAssertEqual(constraintViolations.count, 2)
        XCTAssertEqual(constraintViolations["email"]?.count, 1)
        XCTAssertEqual(constraintViolations["email"]?.first?.message, EmailConstraint.message)
        XCTAssertEqual(constraintViolations["password"]?.count, 1)
        XCTAssertEqual(
            constraintViolations["password"]?.first?.message,
            String(format: LengthConstraint.minMessage, min)
        )

        // Act
        constraintViolations = validator.validate(
            dictionary,
            against: constraints,
            on: GroupSequence(["first", "second"])
        )

        // Assert
        XCTAssertEqual(constraintViolations.count, 3)
        XCTAssertEqual(constraintViolations["email"]?.count, 1)
        XCTAssertEqual(
            constraintViolations["email"]?.first?.message,
            String(format: LengthConstraint.minMessage, min)
        )
        XCTAssertEqual(constraintViolations["username"]?.count, 1)
        XCTAssertEqual(constraintViolations["username"]?.first?.message, NotBlankConstraint.message)
        XCTAssertEqual(constraintViolations["password"]?.count, 1)
        XCTAssertEqual(constraintViolations["password"]?.first?.message, NotBlankConstraint.message)

        // Act
        constraintViolations = validator.validate(
            dictionary,
            against: constraints,
            on: GroupSequence(["second", "first"])
        )

        // Assert
        XCTAssertEqual(constraintViolations.count, 2)
        XCTAssertEqual(constraintViolations["email"]?.count, 1)
        XCTAssertEqual(constraintViolations["email"]?.first?.message, EmailConstraint.message)
        XCTAssertEqual(constraintViolations["password"]?.count, 1)
        XCTAssertEqual(
            constraintViolations["password"]?.first?.message,
            String(format: LengthConstraint.minMessage, min)
        )
    }
}
