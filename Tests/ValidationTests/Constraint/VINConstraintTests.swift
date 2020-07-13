@testable import Validation
import XCTest

final class VINConstraintTests: XCTestCase {
    func testInit() {
        // Act
        let constraint = VINConstraint()

        // Assert
        XCTAssertEqual(constraint.message, VINConstraint.message)
    }

    func testInitWithCustomMessage() {
        // Arrange
        let message = "This value is not a valid VIN."

        // Act
        let constraint = VINConstraint(message: message)

        // Assert
        XCTAssertEqual(constraint.message, message)
    }
}
