@testable import Validation
import XCTest

final class EmailValidatorTests: XCTestCase {
    var validator: EmailValidator!

    override func setUp() {
        super.setUp()

        validator = EmailValidator()
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
        XCTAssertThrowsError(try validator.validate(value, against: EmailConstraint())) { error in
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
        XCTAssertThrowsError(try validator.validate(value, against: EmailConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testValueAgainstImplicitConstraint() {
        // Arrange
        let value = "contact@chaqmoq.dev"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value))
    }

    func testValueAgainstExplicitConstraint() {
        // Arrange
        let value = "contact@chaqmoq.dev"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value, against: EmailConstraint()))
    }

    func testInvalidValueAgainstImplicitConstraint() {
        // Arrange
        let value = "contact.chaqmoq.dev"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testInvalidValueAgainstExplicitConstraint() {
        // Arrange
        let value = "contact@chaqmoq"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: EmailConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testValueWithInvalidConstraint() {
        // Arrange
        let value = "contact.chaqmoq.dev"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: IntegerConstraint())) { error in
            XCTAssertTrue(error is Validator.Error)
        }
    }
}
