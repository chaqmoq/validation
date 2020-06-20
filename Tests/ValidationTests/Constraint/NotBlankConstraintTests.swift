import XCTest
@testable import struct Validation.NotBlankConstraint

final class NotBlankConstraintTestCase: XCTestCase {
    func testInit() {
        // Act
        let constraint = NotBlankConstraint()

        // Assert
        XCTAssertEqual(constraint.message, "This value must not be blank.")
    }
}
