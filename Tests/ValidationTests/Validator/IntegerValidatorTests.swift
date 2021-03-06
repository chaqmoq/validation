@testable import Validation
import XCTest

final class IntegerValidatorTests: XCTestCase {
    var validator: IntegerValidator!

    override func setUp() {
        super.setUp()

        validator = IntegerValidator()
    }

    func testValueAgainstImplicitConstraint() {
        // Arrange
        let value = "1"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value))
    }

    func testValueAgainstExplicitConstraint() {
        // Arrange
        let value = "1"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value, against: IntegerConstraint()))
    }

    func testValueAgainstInvalidConstraint() {
        // Arrange
        let value = "1"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: NotBlankConstraint()))
    }

    func testInvalidValue() {
        // Arrange
        let value = "a"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: IntegerConstraint(exact: 1))) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testValueEqualToExactValue() {
        // Arrange
        let value = "1"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value, against: IntegerConstraint(exact: 1)))
    }

    func testValueNotEqualToExactValue() {
        // Arrange
        let value = "0"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: IntegerConstraint(exact: 1))) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testValueLessThanMinValue() {
        // Arrange
        let value = "-1"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: IntegerConstraint(min: 0))) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testValueEqualToMinValue() {
        // Arrange
        let value = "0"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value, against: IntegerConstraint(min: 0, max: 2)))
    }

    func testValueBetweenMinAndMaxValues() {
        // Arrange
        let value = "1"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value, against: IntegerConstraint(min: 0, max: 2)))
    }

    func testValueEqualToMaxValue() {
        // Arrange
        let value = "2"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value, against: IntegerConstraint(min: 0, max: 2)))
    }

    func testValueMoreThanMaxValue() {
        // Arrange
        let value = "3"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: IntegerConstraint(min: 0, max: 2))) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testValueWhenMinValueIsMoreThanMaxValue() {
        // Arrange
        let value = "0"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: IntegerConstraint(min: 2, max: 1))) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }
}
