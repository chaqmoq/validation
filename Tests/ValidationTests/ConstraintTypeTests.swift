@testable import Validation
import XCTest

final class ConstraintTypeTests: XCTestCase {
    func testBlankType() {
        // Arrange
        let message = "This value must be empty."

        // Act
        let constraint = ConstraintType.blank(message: message).constraint as! BlankConstraint

        // Assert
        XCTAssertEqual(constraint.message, message)
    }

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

    func testIPType() {
        // Arrange
        let message = "This value is not a valid IP address."

        // Act
        let constraint = ConstraintType.ip(message: message).constraint as! IPConstraint

        // Assert
        XCTAssertEqual(constraint.message, message)
    }

    func testJSONType() {
        // Arrange
        let message = "This value is not a valid JSON string."

        // Act
        let constraint = ConstraintType.json(message: message).constraint as! JSONConstraint

        // Assert
        XCTAssertEqual(constraint.message, message)
    }

    func testLengthType() {
        // Arrange
        let min: UInt = 1
        let max: UInt = 2
        let minMessage = "This value must have \(min) characters or more."
        let maxMessage = "This value must have \(max) characters or less."
        let exactMessage = "This value must exactly have 2 characters."

        // Act
        let constraint = ConstraintType.length(
            min: min,
            max: max,
            minMessage: minMessage,
            maxMessage: maxMessage,
            exactMessage: exactMessage
        ).constraint as! LengthConstraint

        // Assert
        XCTAssertEqual(constraint.min, min)
        XCTAssertEqual(constraint.max, max)
        XCTAssertEqual(constraint.minMessage, minMessage)
        XCTAssertEqual(constraint.maxMessage, maxMessage)
        XCTAssertEqual(constraint.exactMessage, exactMessage)
    }

    func testNotBlankType() {
        // Arrange
        let message = "This value is required."

        // Act
        let constraint = ConstraintType.notBlank(message: message).constraint as! NotBlankConstraint

        // Assert
        XCTAssertEqual(constraint.message, message)
    }

    func testRegexType() {
        // Arrange
        let message = "This value is not a valid regular expression."

        // Act
        let constraint = ConstraintType.regex(message: message).constraint as! RegexConstraint

        // Assert
        XCTAssertEqual(constraint.message, message)
    }

    func testUUIDType() {
        // Arrange
        let message = "This value is not a valid UUID."

        // Act
        let constraint = ConstraintType.uuid(message: message).constraint as! UUIDConstraint

        // Assert
        XCTAssertEqual(constraint.message, message)
    }

    func testVINType() {
        // Arrange
        let message = "This value is not a valid VIN."

        // Act
        let constraint = ConstraintType.vin(message: message).constraint as! VINConstraint

        // Assert
        XCTAssertEqual(constraint.message, message)
    }
}
