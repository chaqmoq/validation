import XCTest
@testable import Validation

final class EmailValidatorTests: XCTestCase {
    var validator: EmailValidator!

    override func setUp() {
        super.setUp()

        validator = EmailValidator()
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
        XCTAssertThrowsError(try validator.validate(value, against: EmailConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testValueWithImplicitConstraint() {
        // Arrange
        let value = "contact@chaqmoq.dev"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value))
    }

    func testValueWithExplicitConstraint() {
        // Arrange
        let value = "contact@chaqmoq.dev"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value, against: EmailConstraint()))
    }

    func testInvalidValueWithImplicitConstraint() {
        // Arrange
        let value = "contact.chaqmoq.dev"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testInvalidValueWithExplicitConstraint() {
        // Arrange
        let value = "contact@chaqmoq"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: EmailConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testValueWithInvalidConstraint() {
        // Arrange
        let value = "a"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: IntegerConstraint())) { error in
            XCTAssertTrue(error is ValidatorError)
        }
    }
}
