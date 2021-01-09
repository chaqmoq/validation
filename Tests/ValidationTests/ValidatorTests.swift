@testable import Validation
import XCTest

final class ValidatorTests: XCTestCase {
    var validator: Validator!

    override func setUp() {
        super.setUp()

        validator = Validator()
    }

    func testEmptyValueWithImplicitConstraint() {
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
}
