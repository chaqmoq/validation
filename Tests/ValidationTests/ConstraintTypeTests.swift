import XCTest
@testable import Validation

final class ConstraintTypeTests: XCTestCase {
    func testEmailType() {
        // Arrange
        let message = "This value is not a valid email address."

        // Act
        let constraint = ConstraintType.email(message: message).constraint as! EmailConstraint

        // Assert
        XCTAssertEqual(constraint.message, message)
    }
}
