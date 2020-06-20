import XCTest
@testable import Validation

final class ValidatorTests: XCTestCase {
    var validator: ConstraintValidator!

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
}
