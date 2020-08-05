@testable import Validation
import XCTest

final class RegexConstraintTests: XCTestCase {
    func testInit() {
        // Act
        let constraint = RegexConstraint()

        // Assert
        XCTAssertEqual(constraint.message, RegexConstraint.message)
    }

    func testInitWithCustomMessage() {
        // Arrange
        let message = "This value is not a valid regular expression."

        // Act
        let constraint = RegexConstraint(message: message)

        // Assert
        XCTAssertEqual(constraint.message, message)
    }
}
