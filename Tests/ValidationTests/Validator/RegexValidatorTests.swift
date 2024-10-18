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
        let pattern = "[A-Z]{1,}"
        let nilValue: String? = nil
        let emptyValue = ""
        let invalidValue = "1"
        let value = "A"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(nilValue))
        XCTAssertThrowsError(try validator.validate(nilValue, against: RegexConstraint(pattern))) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertNoThrow(try validator.validate(emptyValue))
        XCTAssertThrowsError(try validator.validate(emptyValue, against: RegexConstraint(pattern))) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertNoThrow(try validator.validate(invalidValue))
        XCTAssertThrowsError(try validator.validate(invalidValue, against: RegexConstraint(pattern))) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertNoThrow(try validator.validate(value))
        XCTAssertNoThrow(try validator.validate(value, against: RegexConstraint(pattern)))
        XCTAssertThrowsError(try validator.validate(value, against: IntegerConstraint())) { error in
            XCTAssertTrue(error is Validator.Error)
        }
    }
}
