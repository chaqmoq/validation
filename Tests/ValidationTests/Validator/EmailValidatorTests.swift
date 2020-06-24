import XCTest
@testable import Validation

final class EmailValidatorTests: XCTestCase {
    var validator: EmailValidator!

    override func setUp() {
        super.setUp()

        validator = EmailValidator()
    }

    func testEmptyValueWithImplicitConstraint() {
        // Arrange
        let value = ""

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testEmptyValueWithExplicitConstraint() {
        // Arrange
        let value = ""

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: EmailConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }
}
