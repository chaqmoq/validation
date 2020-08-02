@testable import Validation
import XCTest

final class UUIDConstraintTests: XCTestCase {
    func testInit() {
        // Act
        let constraint = UUIDConstraint()

        // Assert
        XCTAssertEqual(constraint.message, UUIDConstraint.message)
    }

    func testInitWithCustomMessage() {
        // Arrange
        let message = "This value is not a valid UUID."

        // Act
        let constraint = UUIDConstraint(message: message)

        // Assert
        XCTAssertEqual(constraint.message, message)
    }
}
