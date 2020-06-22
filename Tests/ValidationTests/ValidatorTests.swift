import XCTest
@testable import Validation

final class ValidatorTests: XCTestCase {
    var validator: Validator!

    override func setUp() {
        super.setUp()

        validator = Validator()
    }

    func testValueWithImplicitConstraint() {
        // Arrange
        let value = ""

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value))
    }

    func testValueWithOneConstraint() {
        // Arrange
        let value = ""

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: NotBlankConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testValueWithMultipleConstraints() {
        // Arrange
        let value = "a"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value, against: [.notBlank(), .length(min: 1)]))
    }

    func testInvalidValueWithMultipleConstraints() {
        // Arrange
        let value = "ab"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(
            value,
            against: NotBlankConstraint(), LengthConstraint(max: 1)
        )) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }
}
