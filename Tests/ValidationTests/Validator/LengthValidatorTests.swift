import XCTest
@testable import Validation

final class LengthValidatorTests: XCTestCase {
    var validator: ConstraintValidator!

    override func setUp() {
        super.setUp()

        validator = LengthValidator()
    }

    func testValueAgainstImplicitConstraint() {
        // Arrange
        let value = "a"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value)) { error in
            XCTAssertTrue(error is ValidatorError)
        }
    }

    func testValueAgainstInvalidConstraint() {
        // Arrange
        let value = "a"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: NotBlankConstraint()))
    }

    func testValueEqualToExactValue() {
        // Arrange
        let value = "a"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value, against: LengthConstraint(exact: 1)))
    }

    func testValueNotEqualToExactValue() {
        // Arrange
        let value = "a"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: LengthConstraint(exact: 2))) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testValueLessThanMinimumValue() {
        // Arrange
        let value = "a"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: LengthConstraint(min: 2))) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testValueEqualToMinimumValue() {
        // Arrange
        let value = "a"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value, against: LengthConstraint(min: 1, max: 2)))
    }
}
