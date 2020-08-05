@testable import Validation
import XCTest

final class RegexValidatorTests: XCTestCase {
    var validator: RegexValidator!

    override func setUp() {
        super.setUp()

        validator = RegexValidator()
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
        XCTAssertThrowsError(try validator.validate(value, against: RegexConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testInvalidValueWithImplicitConstraint() {
        // Arrange
        let value = "["

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testInvalidValueWithExplicitConstraint() {
        // Arrange
        let value = "["

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: RegexConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testValueWithImplicitConstraint() {
        // Arrange
        let value = "[a-zA-Z0-9]"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value))
    }

    func testValueWithExplicitConstraint() {
        // Arrange
        let value = "[a-zA-Z0-9]"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value, against: RegexConstraint()))
    }

    func testValueWithInvalidConstraint() {
        // Arrange
        let value = "[a-zA-Z0-9]"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: IntegerConstraint())) { error in
            XCTAssertTrue(error is ValidatorError)
        }
    }
}
