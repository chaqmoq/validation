@testable import Validation
import XCTest

final class BlankValidatorTests: XCTestCase {
    var validator: BlankValidator!

    override func setUp() {
        super.setUp()

        validator = BlankValidator()
    }

    func testValidate() {
        // Arrange
        let nilValue: String? = nil
        let emptyValue = ""
        let value = "a"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(nilValue))
        XCTAssertNoThrow(try validator.validate(nilValue, against: BlankConstraint()))
        XCTAssertNoThrow(try validator.validate(emptyValue))
        XCTAssertNoThrow(try validator.validate(emptyValue, against: BlankConstraint()))
        XCTAssertThrowsError(try validator.validate(value)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(value, against: BlankConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(value, against: IntegerConstraint())) { error in
            XCTAssertTrue(error is Validator.Error)
        }
    }
}
