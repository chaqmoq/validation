@testable import Validation
import XCTest

final class RegexValidatorTests: XCTestCase {
    var validator: RegexValidator!

    override func setUp() {
        super.setUp()

        validator = RegexValidator()
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
        XCTAssertThrowsError(try validator.validate(value, against: RegexConstraint())) { error in
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
        XCTAssertThrowsError(try validator.validate(value, against: RegexConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testInvalidValueAgainstImplicitConstraint() {
        // Arrange
        let value = "["

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testInvalidValueAgainstExplicitConstraint() {
        // Arrange
        let value = "["

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: RegexConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testValueAgainstImplicitConstraint() {
        // Arrange
        let value = "[a-zA-Z0-9]"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value))
    }

    func testValueAgainstExplicitConstraint() {
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
            XCTAssertTrue(error is Validator.Error)
        }
    }
}
