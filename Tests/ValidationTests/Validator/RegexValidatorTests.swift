@testable import Validation
import XCTest

final class RegexValidatorTests: XCTestCase {
    var validator: RegexValidator!

    override func setUp() {
        super.setUp()

        validator = RegexValidator()
    }

    func testValidate() {
        // Arrange
        let nilValue: String? = nil
        let emptyValue = ""
        let invalidValue = "[A-Z{2,}+"
        let value = "[A-Z]{2,}"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(nilValue)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(nilValue, against: RegexConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(emptyValue)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(emptyValue, against: RegexConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(invalidValue)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(invalidValue, against: RegexConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertNoThrow(try validator.validate(value))
        XCTAssertNoThrow(try validator.validate(value, against: RegexConstraint()))
        XCTAssertThrowsError(try validator.validate(value, against: IntegerConstraint())) { error in
            XCTAssertTrue(error is Validator.Error)
        }
    }
}
