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

    func testEncodableValueAgainstConstraintCollectionOnGroupsWithOptions() {
        // Arrange
        struct User: Encodable {
            var firstName: String
            var lastName: String
            var email: String? = nil
            var age: Int
        }

        let encodable = User(firstName: "S", lastName: "K", age: 15)

        var constraintCollection = DictionaryCollection<String, Constraint>()
        constraintCollection["firstName"] = [NotBlankConstraint(), LengthConstraint(min: 2)]
        constraintCollection["lastName"] = [NotBlankConstraint(), LengthConstraint(min: 3)]
        constraintCollection["email"] = [NotBlankConstraint(), EmailConstraint()]
        constraintCollection["age"] = [NotBlankConstraint(), IntegerConstraint(min: 16)]

        // Act
        var constraintViolationCollection = try! validator.validate(nil, against: constraintCollection)

        // Assert
        XCTAssertTrue(constraintViolationCollection.isEmpty)

        // Act
        constraintViolationCollection = try! validator.validate(encodable, against: constraintCollection)

        // Assert
        XCTAssertEqual(constraintViolationCollection.count, 3)
        XCTAssertEqual(constraintViolationCollection["firstName"].count, 1)
        XCTAssertEqual(
            constraintViolationCollection["firstName"].first?.message,
            String(format: LengthConstraint.minMessage, 2)
        )
        XCTAssertEqual(constraintViolationCollection["lastName"].count, 1)
        XCTAssertEqual(
            constraintViolationCollection["lastName"].first?.message,
            String(format: LengthConstraint.minMessage, 3)
        )
        XCTAssertEqual(constraintViolationCollection["age"].count, 1)
        XCTAssertEqual(
            constraintViolationCollection["age"].first?.message,
            String(format: IntegerConstraint.minMessage, 16)
        )

        // Act
        constraintViolationCollection = try! validator.validate(
            encodable,
            against: constraintCollection,
            with: [.strict]
        )

        // Assert
        XCTAssertEqual(constraintViolationCollection.count, 4)
        XCTAssertEqual(constraintViolationCollection["firstName"].count, 1)
        XCTAssertEqual(
            constraintViolationCollection["firstName"].first?.message,
            String(format: LengthConstraint.minMessage, 2)
        )
        XCTAssertEqual(constraintViolationCollection["lastName"].count, 1)
        XCTAssertEqual(
            constraintViolationCollection["lastName"].first?.message,
            String(format: LengthConstraint.minMessage, 3)
        )
        XCTAssertEqual(constraintViolationCollection["email"].count, 2)
        XCTAssertEqual(
            constraintViolationCollection["email"].first?.message,
            NotBlankConstraint.message
        )
        XCTAssertEqual(
            constraintViolationCollection["email"].last?.message,
            EmailConstraint.message
        )
        XCTAssertEqual(constraintViolationCollection["age"].count, 1)
        XCTAssertEqual(
            constraintViolationCollection["age"].first?.message,
            String(format: IntegerConstraint.minMessage, 16)
        )
    }

    func testEncodableValueAgainstConstraintCollectionOnGroupSequenceWithOptions() {
        // Arrange
        struct User: Encodable {
            var email: String
            var username: String? = nil
            var password: String
        }

        let encodable = User(email: "", password: "")

        var constraintCollection = DictionaryCollection<String, Constraint>()
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
        var constraintViolationCollection = try! validator.validate(
            nil,
            against: constraintCollection,
            on: GroupSequence(["first", "second"])
        )

        // Assert
        XCTAssertTrue(constraintViolationCollection.isEmpty)

        // Act
        constraintViolationCollection = try! validator.validate(
            encodable,
            against: .init(),
            on: GroupSequence(["first", "second"])
        )

        // Assert
        XCTAssertTrue(constraintViolationCollection.isEmpty)

        // Act
        constraintViolationCollection = try! validator.validate(
            encodable,
            against: constraintCollection,
            on: GroupSequence(["first", "second"])
        )

        // Assert
        XCTAssertEqual(constraintViolationCollection.count, 2)
        XCTAssertEqual(constraintViolationCollection["email"].count, 2)
        XCTAssertEqual(constraintViolationCollection["email"].first?.message, NotBlankConstraint.message)
        XCTAssertEqual(
            constraintViolationCollection["email"].last?.message,
            String(format: LengthConstraint.minMessage, 2)
        )
        XCTAssertEqual(constraintViolationCollection["password"].count, 1)
        XCTAssertEqual(constraintViolationCollection["password"].first?.message, NotBlankConstraint.message)

        // Act
        constraintViolationCollection = try! validator.validate(
            encodable,
            against: constraintCollection,
            on: GroupSequence(["second", "first"]),
            with: [.strict]
        )

        // Assert
        XCTAssertEqual(constraintViolationCollection.count, 2)
        XCTAssertEqual(constraintViolationCollection["email"].count, 1)
        XCTAssertEqual(constraintViolationCollection["email"].first?.message, EmailConstraint.message)
        XCTAssertEqual(constraintViolationCollection["password"].count, 1)
        XCTAssertEqual(
            constraintViolationCollection["password"].first?.message,
            String(format: LengthConstraint.minMessage, 16)
        )
    }
}
