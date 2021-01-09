@testable import Validation
import XCTest

final class ConstraintViolationTests: XCTestCase {
    func testInit() {
        // Arrange
        let message = "This value is required."

        // Act
        let violation = ConstraintViolation(message)

        // Assert
        XCTAssertEqual(violation.message, message)
        XCTAssertEqual(violation.message, violation.errorDescription)
    }
}
