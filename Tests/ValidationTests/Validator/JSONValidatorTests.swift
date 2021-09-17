@testable import Validation
import XCTest

final class JSONValidatorTests: XCTestCase {
    var validator: JSONValidator!

    override func setUp() {
        super.setUp()

        validator = JSONValidator()
    }

    func testNilValueAgainstImplicitConstraint() {
        // Arrange
        let value: String? = nil

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testNilValueAgainstExplicitConstraint() {
        // Arrange
        let value: String? = nil

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: JSONConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testEmptyValueAgainstImplicitConstraint() {
        // Arrange
        let value = ""

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testEmptyValueAgainstExplicitConstraint() {
        // Arrange
        let value = ""

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: JSONConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testInvalidValueAgainstImplicitConstraint() {
        // Arrange
        let value = "a"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testInvalidValueAgainstExplicitConstraint() {
        // Arrange
        let value = "a"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: JSONConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testValueAgainstImplicitConstraint() {
        // Arrange
        let value = "{\"title\": \"New post\", \"likesCount\": 100}"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value))
    }

    func testValueAgainstExplicitConstraint() {
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
            XCTAssertTrue(error is Validator.Error)
        }
    }
}
