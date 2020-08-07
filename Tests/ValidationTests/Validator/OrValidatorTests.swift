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
        XCTAssertNoThrow(try validator.validate(value))
    }

    func testEmptyValueWithExplicitConstraint() {
        // Arrange
        let value = ""

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value, against: OrConstraint()))
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
        let value = "abc"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: IntegerConstraint())) { error in
            XCTAssertTrue(error is ValidatorError)
        }
    }
}
