@testable import Validation
import XCTest

final class IPConstraintTests: XCTestCase {
    func testInit() {
        // Act
        let constraint = IPConstraint()

        // Assert
        XCTAssertEqual(constraint.message, IPConstraint.message)
    }

    func testInitWithCustomMessage() {
        // Arrange
        let message = "This value is not a valid IP address."

        // Act
        let constraint = IPConstraint(message: message)

        // Assert
        XCTAssertEqual(constraint.message, message)
    }
}
