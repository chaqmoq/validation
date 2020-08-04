@testable import Validation
import XCTest

final class URLConstraintTests: XCTestCase {
    func testInit() {
        // Act
        let constraint = URLConstraint()

        // Assert
        XCTAssertEqual(constraint.message, URLConstraint.message)
    }

    func testInitWithCustomMessage() {
        // Arrange
        let message = "This value is not a valid URL."

        // Act
        let constraint = URLConstraint(message: message)

        // Assert
        XCTAssertEqual(constraint.message, message)
    }
}
