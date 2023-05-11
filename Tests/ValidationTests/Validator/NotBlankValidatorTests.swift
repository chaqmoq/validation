@testable import Validation
import XCTest

final class NotBlankValidatorTests: XCTestCase {
    var validator: NotBlankValidator!

    override func setUp() {
        super.setUp()

        validator = NotBlankValidator()
    }

    func testValidate() {
        // Arrange
        let nilValue: String? = nil
        let emptyValue = ""
        let value = "a"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(nilValue)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(nilValue, against: NotBlankConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(emptyValue)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(emptyValue, against: NotBlankConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertNoThrow(try validator.validate(value))
        XCTAssertNoThrow(try validator.validate(value, against: NotBlankConstraint()))
        XCTAssertThrowsError(try validator.validate(value, against: IntegerConstraint())) { error in
            XCTAssertTrue(error is Validator.Error)
        }
    }
}
