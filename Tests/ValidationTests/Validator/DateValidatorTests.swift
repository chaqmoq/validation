@testable import Validation
import XCTest

final class DateValidatorTests: XCTestCase {
    var validator: DateValidator!

    override func setUp() {
        super.setUp()

        validator = DateValidator()
    }

    func testValidate() {
        // Arrange
        let value = "2022-01-31T02:22:40Z"
        let nilValue: String? = nil
        let emptyValue = ""
        let invalidValue = "12345"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value))
        XCTAssertNoThrow(try validator.validate(value, against: DateConstraint()))

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(nilValue)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(nilValue, against: DateConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(emptyValue)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(emptyValue, against: DateConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(invalidValue)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(invalidValue, against: DateConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: IntegerConstraint())) { error in
            XCTAssertTrue(error is Validator.Error)
        }
        XCTAssertThrowsError(try validator.validate(nilValue, against: IntegerConstraint())) { error in
            XCTAssertTrue(error is Validator.Error)
        }
        XCTAssertThrowsError(try validator.validate(emptyValue, against: IntegerConstraint())) { error in
            XCTAssertTrue(error is Validator.Error)
        }
        XCTAssertThrowsError(try validator.validate(invalidValue, against: IntegerConstraint())) { error in
            XCTAssertTrue(error is Validator.Error)
        }
    }
}
