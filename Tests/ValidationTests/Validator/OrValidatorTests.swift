@testable import Validation
import XCTest

final class OrValidatorTests: XCTestCase {
    var validator: OrValidator!

    override func setUp() {
        super.setUp()

        validator = OrValidator()
    }

    func testEmptyValueWithImplicitConstraint() {
        // Arrange
        let value = ""

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testEmptyValueWithExplicitConstraint() {
        // Arrange
        let value = ""

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: OrConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testInvalidValueWithImplicitConstraint() {
        // Arrange
        let value = "a"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testInvalidValueWithExplicitConstraint() {
        // Arrange
        let value = "a"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: OrConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testValueWithChildConstraints() {
        // Arrange
        let value = "ab"

        // Act/Assert
        XCTAssertNoThrow(
            try validator.validate(
                value,
                against: OrConstraint([IntegerConstraint(), LengthConstraint(min: 1, max: 2)])
            )
        )
    }

    func testInvalidValueWithChildConstraints() {
        // Arrange
        let value = "abc"

        // Act/Assert
        XCTAssertThrowsError(
            try validator.validate(
                value,
                against: OrConstraint([IntegerConstraint(), LengthConstraint(min: 1, max: 2)])
            )
        ) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testValueWithInvalidConstraint() {
        // Arrange
        let value = "123"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: IntegerConstraint())) { error in
            XCTAssertTrue(error is ValidatorError)
        }
    }
}
