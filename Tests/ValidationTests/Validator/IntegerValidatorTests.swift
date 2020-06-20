import XCTest
@testable import Validation

final class IntegerValidatorTests: XCTestCase {
    var validator: ConstraintValidator!

    override func setUp() {
        super.setUp()

        validator = IntegerValidator()
    }

    func testValueAgainstImplicitConstraint() {
        // Arrange
        let value = "1"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value))
    }

    func testValueAgainstExplicitConstraint() {
        // Arrange
        let value = "1"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value, against: IntegerConstraint()))
    }

    func testValueAgainstInvalidConstraint() {
        // Arrange
        let value = "1"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: NotBlankConstraint()))
    }
}
