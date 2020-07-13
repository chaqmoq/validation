@testable import Validation
import XCTest

final class EmailConstraintTests: XCTestCase {
    func testInit() {
        // Act
        let constraint = EmailConstraint()

        // Assert
        XCTAssertEqual(constraint.message, "This value must be a valid email address.")
    }

    func testInitWithCustomMessage() {
        // Arrange
        let message = "This value is not a valid email address."

        // Act
        let constraint = EmailConstraint(message: message)

        // Assert
        XCTAssertEqual(constraint.message, message)
    }
}
