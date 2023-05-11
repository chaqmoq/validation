@testable import Validation
import XCTest

final class AndValidatorTests: XCTestCase {
    var validator: AndValidator!

    override func setUp() {
        super.setUp()

        validator = AndValidator()
    }

    func testValidate() {
        // Arrange
        let emptyValue = ""
        let value = "12"
        let invalidValue = "abc"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(emptyValue))
        XCTAssertNoThrow(try validator.validate(emptyValue, against: AndConstraint()))
        XCTAssertNoThrow(
            try validator.validate(
                value,
                against: AndConstraint([IntegerConstraint(), LengthConstraint(min: 1, max: 2)])
            )
        )
        XCTAssertThrowsError(try validator.validate(value, against: IntegerConstraint())) { error in
            XCTAssertTrue(error is Validator.Error)
        }
        XCTAssertThrowsError(
            try validator.validate(
                invalidValue,
                against: AndConstraint([IntegerConstraint(), LengthConstraint(min: 1, max: 2)])
            )
        ) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }
}
