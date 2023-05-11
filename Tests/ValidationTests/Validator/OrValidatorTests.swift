@testable import Validation
import XCTest

final class OrValidatorTests: XCTestCase {
    var validator: OrValidator!

    override func setUp() {
        super.setUp()

        validator = OrValidator()
    }

    func testValidate() {
        // Arrange
        let emptyValue = ""
        let invalidValue = "ab"
        let value = "abc"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(emptyValue))
        XCTAssertNoThrow(try validator.validate(emptyValue, against: OrConstraint()))
        XCTAssertNoThrow(
            try validator.validate(
                invalidValue,
                against: OrConstraint([IntegerConstraint(), LengthConstraint(min: 1, max: 2)])
            )
        )
        XCTAssertThrowsError(
            try validator.validate(
                value,
                against: OrConstraint([IntegerConstraint(), LengthConstraint(min: 1, max: 2)])
            )
        ) { error in
            XCTAssertTrue(error is Validator.Error)
        }
        XCTAssertThrowsError(try validator.validate(value, against: IntegerConstraint())) { error in
            XCTAssertTrue(error is Validator.Error)
        }
    }
}
