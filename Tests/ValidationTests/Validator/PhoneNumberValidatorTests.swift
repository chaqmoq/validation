@testable import Validation
import XCTest

final class PhoneNumberValidatorTests: XCTestCase {
    var validator: PhoneNumberValidator!

    override func setUp() {
        super.setUp()

        validator = PhoneNumberValidator()
    }

    func testValidate() {
        // Arrange
        let nilValue: String? = nil
        let emptyValue = ""
        let invalidValues = ["a", "2", "0291"]
        let values = ["+1 212 456 7890", "+44 20 7031 3000", "+998 97 7654321"]

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(nilValue)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(nilValue, against: PhoneNumberConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(emptyValue)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(emptyValue, against: PhoneNumberConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }

        for invalidValue in invalidValues {
            XCTAssertThrowsError(try validator.validate(invalidValue)) { error in
                XCTAssertTrue(error is ConstraintViolation)
            }
            XCTAssertThrowsError(try validator.validate(invalidValue, against: PhoneNumberConstraint())) { error in
                XCTAssertTrue(error is ConstraintViolation)
            }
        }

        for value in values {
            XCTAssertNoThrow(try validator.validate(value))
            XCTAssertNoThrow(try validator.validate(value, against: PhoneNumberConstraint()))
            XCTAssertThrowsError(try validator.validate(value, against: IntegerConstraint())) { error in
                XCTAssertTrue(error is Validator.Error)
            }
        }
    }
}
