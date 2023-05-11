@testable import Validation
import XCTest

final class LengthValidatorTests: XCTestCase {
    var validator: LengthValidator!

    override func setUp() {
        super.setUp()

        validator = LengthValidator()
    }

    func testValidate() {
        // Arrange
        let nilValue: String? = nil
        let value = "a"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(nilValue, against: LengthConstraint(exact: 2))) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertNoThrow(try validator.validate(value))
        XCTAssertThrowsError(try validator.validate(value, against: NotBlankConstraint()))
        XCTAssertNoThrow(try validator.validate(value, against: LengthConstraint(exact: 1)))
        XCTAssertThrowsError(try validator.validate(value, against: LengthConstraint(exact: 2))) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(value, against: LengthConstraint(min: 2))) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertNoThrow(try validator.validate(value, against: LengthConstraint(min: 1, max: 2)))
        XCTAssertNoThrow(try validator.validate(value, against: LengthConstraint(min: 0, max: 2)))
        XCTAssertThrowsError(try validator.validate(value, against: LengthConstraint(min: 2, max: 1))) { error in
            XCTAssertTrue(error is Validator.Error)
        }
        XCTAssertNoThrow(try validator.validate("ab", against: LengthConstraint(min: 0, max: 2)))
        XCTAssertThrowsError(try validator.validate("abc", against: LengthConstraint(min: 0, max: 2))) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }
}
