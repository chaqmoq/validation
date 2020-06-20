import XCTest
@testable import struct Validation.VINConstraint

final class VINConstraintTests: XCTestCase {
    func testInit() {
        // Act
        let constraint = VINConstraint()

        // Assert
        XCTAssertEqual(constraint.message, "This value must be a valid VIN.")
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
