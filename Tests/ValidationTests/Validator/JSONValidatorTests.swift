@testable import Validation
import XCTest

final class JSONValidatorTests: XCTestCase {
    var validator: JSONValidator!

    override func setUp() {
        super.setUp()

        validator = JSONValidator()
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
        XCTAssertThrowsError(try validator.validate(value, against: JSONConstraint())) { error in
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
        XCTAssertThrowsError(try validator.validate(value, against: JSONConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testValueWithImplicitConstraint() {
        // Arrange
        let value = "{\"title\": \"New post\", \"likesCount\": 100}"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value))
    }

    func testValueWithExplicitConstraint() {
        // Arrange
        let value = "{\"title\": \"New post\", \"likesCount\": 100}"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value, against: JSONConstraint()))
    }

    func testValueWithInvalidConstraint() {
        // Arrange
        let value = "{\"title\": \"New post\", \"likesCount\": 100}"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: IntegerConstraint())) { error in
            XCTAssertTrue(error is ValidatorError)
        }
    }
}
