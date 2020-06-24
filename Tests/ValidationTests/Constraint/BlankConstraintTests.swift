import XCTest
@testable import struct Validation.BlankConstraint

final class BlankConstraintTests: XCTestCase {
    func testInit() {
        // Act
        let constraint = BlankConstraint()

        // Assert
        XCTAssertEqual(constraint.message, "This value must be blank.")
    }

    func testInitWithCustomMessage() {
        // Arrange
        let message = "This value must be empty."

        // Act
        let constraint = BlankConstraint(message: message)

        // Assert
        XCTAssertEqual(constraint.message, message)
    }
}
