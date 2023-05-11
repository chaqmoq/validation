@testable import Validation
import XCTest

final class IntegerValidatorTests: XCTestCase {
    var validator: IntegerValidator!

    override func setUp() {
        super.setUp()

        validator = IntegerValidator()
    }

    func testValidate() {
        // Arrange
        let nilValue: String? = nil
        let values = [0, 1, 2]
        let invalidValue = "a"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(nilValue)) { error in
            XCTAssertTrue(error is Validator.Error)
        }
        XCTAssertThrowsError(try validator.validate(nilValue, against: IntegerConstraint())) { error in
            XCTAssertTrue(error is Validator.Error)
        }
        XCTAssertThrowsError(try validator.validate(invalidValue, against: IntegerConstraint(exact: 1))) { error in
            XCTAssertTrue(error is Validator.Error)
        }
        XCTAssertThrowsError(try validator.validate(-1, against: IntegerConstraint(min: 0))) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertNoThrow(try validator.validate(0, against: IntegerConstraint(min: 0, max: 2)))
        XCTAssertThrowsError(try validator.validate(0, against: IntegerConstraint(exact: 1))) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(0, against: IntegerConstraint(min: 2, max: 1))) { error in
            XCTAssertTrue(error is Validator.Error)
        }
        XCTAssertNoThrow(try validator.validate(1, against: IntegerConstraint(exact: 1)))
        XCTAssertThrowsError(try validator.validate(3, against: IntegerConstraint(min: 0, max: 2))) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }

        for value in values {
            XCTAssertNoThrow(try validator.validate(value))
            XCTAssertNoThrow(try validator.validate(value, against: IntegerConstraint()))
            XCTAssertThrowsError(try validator.validate(value, against: NotBlankConstraint()))
            XCTAssertNoThrow(try validator.validate(value, against: IntegerConstraint(min: 0, max: 2)))
        }
    }
}
