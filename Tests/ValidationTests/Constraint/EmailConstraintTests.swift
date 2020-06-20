import XCTest
@testable import struct Validation.EmailConstraint

final class EmailConstraintTests: XCTestCase {
    func testInit() {
        // Act
        let constraint = EmailConstraint()

        // Assert
        XCTAssertEqual(constraint.message, "This value must be a valid email address.")
    }
}
