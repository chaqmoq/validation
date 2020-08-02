@testable import Validation
import XCTest

final class UUIDValidatorTests: XCTestCase {
    var validator: UUIDValidator!

    override func setUp() {
        super.setUp()

        validator = UUIDValidator()
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
        XCTAssertThrowsError(try validator.validate(value)) { error in
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
        XCTAssertThrowsError(try validator.validate(value, against: UUIDConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testValueWithImplicitConstraint() {
        // Arrange
        let value = "2a8fc0a9-9b86-4a95-b9bf-6b42eb7e69d5"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value))
    }

    func testValueWithExplicitConstraint() {
        // Arrange
        let value = "2a8fc0a9-9b86-4a95-b9bf-6b42eb7e69d5"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value, against: UUIDConstraint()))
    }

    func testValueWithInvalidConstraint() {
        // Arrange
        let value = "2a8fc0a9-9b86-4a95-b9bf-6b42eb7e69d5"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: IntegerConstraint())) { error in
            XCTAssertTrue(error is ValidatorError)
        }
    }
}
