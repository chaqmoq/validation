@testable import Validation
import XCTest

final class EmailConstraintTests: XCTestCase {
    func testInit() {
        // Act
        let constraint = EmailConstraint()

        // Assert
        XCTAssertEqual(constraint.message, EmailConstraint.message)
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
