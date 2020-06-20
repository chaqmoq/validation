import XCTest
@testable import struct Validation.ConstraintViolation

final class ConstraintViolationTests: XCTestCase {
    func testInit() {
        // Arrange
        let message = "This value is required."

        // Act
        let violation = ConstraintViolation(message: message)

        // Assert
        XCTAssertEqual(violation.message, message)
        XCTAssertEqual(violation.message, violation.errorDescription)
    }
}
