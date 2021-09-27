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

    func testEncodableValueAgainstConstraintCollection() {
        // Arrange
        struct User: Encodable {
            var firstName: String
            var lastName: String
            var age: Int
        }

        let encodable = User(firstName: "S", lastName: "K", age: 15)

        var constraintCollection = DictionaryCollection<Constraint>()
        constraintCollection["firstName"] = [NotBlankConstraint(), LengthConstraint(min: 2)]
        constraintCollection["lastName"] = [NotBlankConstraint(), LengthConstraint(min: 3)]
        constraintCollection["age"] = [NotBlankConstraint(), IntegerConstraint(min: 16)]

        // Act
        let constraintViolations = try! validator.validate(encodable, against: constraintCollection)

        // Assert
        XCTAssertEqual(constraintViolations.count, 3)
        XCTAssertEqual(constraintViolations["firstName"].count, 1)
        XCTAssertEqual(
            constraintViolations["firstName"].first?.message,
            String(format: LengthConstraint.minMessage, 2)
        )
        XCTAssertEqual(constraintViolations["lastName"].count, 1)
        XCTAssertEqual(
            constraintViolations["lastName"].first?.message,
            String(format: LengthConstraint.minMessage, 3)
        )
        XCTAssertEqual(constraintViolations["age"].count, 1)
        XCTAssertEqual(
            constraintViolations["age"].first?.message,
            String(format: IntegerConstraint.minMessage, 16)
        )
    }

    func testEncodableValueAgainstConstraintCollectionOnGroupSequence() {
        // Arrange
        struct User: Encodable {
            var email: String
            var username: String
            var password: String
        }

        let encodable = User(email: "", username: "", password: "")

        var constraintCollection = DictionaryCollection<Constraint>()
        constraintCollection["email"] = [
            NotBlankConstraint(groups: ["first"]),
            LengthConstraint(min: 2, groups: ["first"]),
            EmailConstraint(groups: ["second"])
        ]
        constraintCollection["username"] = [
            NotBlankConstraint(groups: ["first"])
        ]
        constraintCollection["password"] = [
            NotBlankConstraint(groups: ["first"]),
            LengthConstraint(min: 16, groups: ["second"])
        ]

        // Act
        var constraintViolations = try! validator.validate(
            encodable,
            against: constraintCollection,
            on: GroupSequence(["first", "second"])
        )

        // Assert
        XCTAssertEqual(constraintViolations.count, 3)
        XCTAssertEqual(constraintViolations["email"].count, 2)
        XCTAssertEqual(constraintViolations["email"].first?.message, NotBlankConstraint.message)
        XCTAssertEqual(
            constraintViolations["email"].last?.message,
            String(format: LengthConstraint.minMessage, 2)
        )
        XCTAssertEqual(constraintViolations["username"].count, 1)
        XCTAssertEqual(constraintViolations["username"].first?.message, NotBlankConstraint.message)
        XCTAssertEqual(constraintViolations["password"].count, 1)
        XCTAssertEqual(constraintViolations["password"].first?.message, NotBlankConstraint.message)

        // Act
        constraintViolations = try! validator.validate(
            encodable,
            against: constraintCollection,
            on: GroupSequence(["second", "first"]),
            with: [.strict]
        )

        // Assert
        XCTAssertEqual(constraintViolations.count, 2)
        XCTAssertEqual(constraintViolations["email"].count, 1)
        XCTAssertEqual(constraintViolations["email"].first?.message, EmailConstraint.message)
        XCTAssertEqual(constraintViolations["password"].count, 1)
        XCTAssertEqual(
            constraintViolations["password"].first?.message,
            String(format: LengthConstraint.minMessage, 16)
        )
    }
}
