@testable import Validation
import XCTest

final class NotBlankConstraintTests: XCTestCase {
    func testInit() {
        // Act
        let constraint = NotBlankConstraint()

        // Assert
        XCTAssertEqual(constraint.message, "This value must not be blank.")
    }

    func testInitWithCustomMessage() {
        // Arrange
        let message = "This value is required."

        // Act
        let constraint = NotBlankConstraint(message: message)

        // Assert
        XCTAssertEqual(constraint.message, message)
    }
}
