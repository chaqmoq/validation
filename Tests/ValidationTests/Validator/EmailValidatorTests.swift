@testable import Validation
import XCTest

final class EmailValidatorTests: XCTestCase {
    var validator: EmailValidator!

    override func setUp() {
        super.setUp()

        validator = EmailValidator()
    }

    func testValidate() {
        // Arrange
        let nilValue: String? = nil
        let emptyValue = ""
        let value = "contact@chaqmoq.dev"
        let invalidValue = "contact.chaqmoq.dev"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(nilValue)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(nilValue, against: EmailConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(emptyValue)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(emptyValue, against: EmailConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertNoThrow(try validator.validate(value))
        XCTAssertNoThrow(try validator.validate(value, against: EmailConstraint()))
        XCTAssertThrowsError(try validator.validate(invalidValue)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(invalidValue, against: EmailConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(value, against: IntegerConstraint())) { error in
            XCTAssertTrue(error is Validator.Error)
        }
    }
}
