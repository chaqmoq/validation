@testable import Validation
import XCTest

final class LengthValidatorTests: XCTestCase {
    var validator: LengthValidator!

    override func setUp() {
        super.setUp()

        validator = LengthValidator()
    }

    func testValueAgainstImplicitConstraint() {
        // Arrange
        let value = "a"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value))
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

    func testValueBetweenMinimumAndMaximumValues() {
        // Arrange
        let value = "a"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value, against: LengthConstraint(min: 0, max: 2)))
    }

    func testValueEqualToMaximumValue() {
        // Arrange
        let value = "ab"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value, against: LengthConstraint(min: 0, max: 2)))
    }

    func testValueMoreThanMaximumValue() {
        // Arrange
        let value = "abc"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: LengthConstraint(min: 0, max: 2))) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testValueWhenMinimumValueIsMoreThanMaximumValue() {
        // Arrange
        let value = "a"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: LengthConstraint(min: 2, max: 1))) { error in
            XCTAssertTrue(error is Validator.Error)
        }
    }
}
