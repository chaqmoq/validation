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
        let dictionary: [String: Any] = [
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
}
