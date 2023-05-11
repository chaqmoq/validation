@testable import Validation
import XCTest

final class ChoiceValidatorTests: XCTestCase {
    var validator: ChoiceValidator!

    override func setUp() {
        super.setUp()

        validator = ChoiceValidator()
    }

    func testValidate() {
        // Arrange
        let choices = ["first", "second", "third"]
        let value = "first"
        let nilValue: String? = nil
        let emptyValue = ""
        let invalidValue = "12345"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value, against: ChoiceConstraint(choices)))
        XCTAssertThrowsError(try validator.validate(nilValue)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(nilValue, against: ChoiceConstraint(choices))) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(emptyValue)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(emptyValue, against: ChoiceConstraint(choices))) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(invalidValue)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(invalidValue, against: ChoiceConstraint(choices))) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
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
