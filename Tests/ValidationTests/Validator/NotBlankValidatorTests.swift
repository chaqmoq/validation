@testable import Validation
import XCTest

final class NotBlankValidatorTests: XCTestCase {
    var validator: NotBlankValidator!

    override func setUp() {
        super.setUp()

        validator = NotBlankValidator()
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
        XCTAssertThrowsError(try validator.validate(value, against: NotBlankConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testValueWithImplicitConstraint() {
        // Arrange
        let value = "a"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value))
    }

    func testValueWithExplicitConstraint() {
        // Arrange
        let value = "a"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value, against: NotBlankConstraint()))
    }

    func testValueWithInvalidConstraint() {
        // Arrange
        let value = "a"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: IntegerConstraint())) { error in
            XCTAssertTrue(error is Validator.Error)
        }
    }
}
