@testable import Validation
import XCTest

final class AndValidatorTests: XCTestCase {
    var validator: AndValidator!

    override func setUp() {
        super.setUp()

        validator = AndValidator()
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
        XCTAssertNoThrow(try validator.validate(value, against: AndConstraint()))
    }

    func testValueWithChildConstraints() {
        // Arrange
        let value = "12"

        // Act/Assert
        XCTAssertNoThrow(
            try validator.validate(
                value,
                against: AndConstraint([IntegerConstraint(), LengthConstraint(min: 1, max: 2)])
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
                against: AndConstraint([IntegerConstraint(), LengthConstraint(min: 1, max: 2)])
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
