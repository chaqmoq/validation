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

    func testIntegerType() {
        // Arrange
        let min = 1
        let max = 2
        let minMessage = "This value must have \(min) characters or more."
        let maxMessage = "This value must have \(max) characters or less."
        let exactMessage = "This value must exactly have 2 characters."

        // Act
        let constraint = ConstraintType.integer(
            min: min,
            max: max,
            minMessage: minMessage,
            maxMessage: maxMessage,
            exactMessage: exactMessage
        ).constraint as! IntegerConstraint

        // Assert
        XCTAssertEqual(constraint.min, min)
        XCTAssertEqual(constraint.max, max)
        XCTAssertEqual(constraint.minMessage, minMessage)
        XCTAssertEqual(constraint.maxMessage, maxMessage)
        XCTAssertEqual(constraint.exactMessage, exactMessage)
    }
}
