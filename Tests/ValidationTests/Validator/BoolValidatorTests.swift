@testable import Validation
import XCTest

final class BoolValidatorTests: XCTestCase {
    var validator: BoolValidator!

    override func setUp() {
        super.setUp()

        validator = BoolValidator()
    }

    func testValidate() {
        // Arrange
        let nilValue: String? = nil
        let emptyValue = ""
        let invalidValue = "a"
        let values = ["true", "false"]

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(nilValue)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(nilValue, against: BoolConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(emptyValue)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(emptyValue, against: BoolConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(invalidValue)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(invalidValue, against: BoolConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }

        for value in values {
            XCTAssertNoThrow(try validator.validate(value))
            XCTAssertNoThrow(try validator.validate(value, against: BoolConstraint()))
            XCTAssertThrowsError(try validator.validate(value, against: IntegerConstraint())) { error in
                XCTAssertTrue(error is Validator.Error)
            }
        }
    }
}
