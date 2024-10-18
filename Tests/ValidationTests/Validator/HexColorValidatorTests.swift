@testable import Validation
import XCTest

final class HexColorValidatorTests: XCTestCase {
    var validator: HexColorValidator!

    override func setUp() {
        super.setUp()

        validator = HexColorValidator()
    }

    func testValidate() {
        // Arrange
        let nilValue: String? = nil
        let emptyValue = ""
        let invalidValues = ["a", "bb", "#cc", "#ddddddd"]
        let values = ["ffffff", "#FFFFFF", "#3195b5", "3195B5"]

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(nilValue)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(nilValue, against: HexColorConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(emptyValue)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(emptyValue, against: HexColorConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }

        for invalidValue in invalidValues {
            XCTAssertThrowsError(try validator.validate(invalidValue)) { error in
                XCTAssertTrue(error is ConstraintViolation)
            }
            XCTAssertThrowsError(try validator.validate(invalidValue, against: HexColorConstraint())) { error in
                XCTAssertTrue(error is ConstraintViolation)
            }
        }

        for value in values {
            XCTAssertNoThrow(try validator.validate(value))
            XCTAssertNoThrow(try validator.validate(value, against: HexColorConstraint()))
            XCTAssertThrowsError(try validator.validate(value, against: IntegerConstraint())) { error in
                XCTAssertTrue(error is Validator.Error)
            }
        }
    }
}
