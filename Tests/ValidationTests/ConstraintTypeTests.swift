@testable import Validation
import XCTest

final class ConstraintTypeTests: XCTestCase {
    func testAndType() {
        // Arrange
        let groups: Set<Group> = [.default, "custom"]

        // Act
        let constraint = ConstraintType.and([.notBlank(), .length()], groups: groups).constraint as! AndConstraint

        // Assert
        XCTAssertEqual(constraint.constraints.count, 2)
        XCTAssertEqual(constraint.groups, groups)
    }

    func testBlankType() {
        // Arrange
        let message = "This value must be empty."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        let constraint = ConstraintType.blank(message, groups: groups).constraint as! BlankConstraint

        // Assert
        XCTAssertEqual(constraint.message, message)
        XCTAssertEqual(constraint.groups, groups)
    }

    func testChoiceType() {
        // Arrange
        let choices = ["first", "second", "third"]
        let message = "This value is not a valid choice."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        let constraint = ConstraintType.choice(
            choices,
            message: message,
            groups: groups
        ).constraint as! ChoiceConstraint

        // Assert
        XCTAssertEqual(constraint.choices as? [String], choices)
        XCTAssertEqual(constraint.message, message)
        XCTAssertEqual(constraint.groups, groups)
    }

    func testDateType() {
        // Arrange
        let dateFormatter = DateFormatter()
        let message = "This value is not a valid date."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        let constraint = ConstraintType.date(
            dateFormatter,
            message: message,
            groups: groups
        ).constraint as! DateConstraint

        // Assert
        XCTAssertEqual(constraint.dateFormatter, dateFormatter)
        XCTAssertEqual(constraint.message, message)
        XCTAssertEqual(constraint.groups, groups)
    }

    func testEmailType() {
        // Arrange
        let message = "This value is not a valid email address."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        let constraint = ConstraintType.email(message, groups: groups).constraint as! EmailConstraint

        // Assert
        XCTAssertEqual(constraint.message, message)
        XCTAssertEqual(constraint.groups, groups)
    }

    func testIntegerType() {
        // Arrange
        let min = 1
        let max = 2
        let minMessage = "This value must have \(min) characters or more."
        let maxMessage = "This value must have \(max) characters or less."
        let exactMessage = "This value must exactly have 2 characters."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        let constraint = ConstraintType.integer(
            min: min,
            max: max,
            minMessage: minMessage,
            maxMessage: maxMessage,
            exactMessage: exactMessage,
            groups: groups
        ).constraint as! IntegerConstraint

        // Assert
        XCTAssertEqual(constraint.min, min)
        XCTAssertEqual(constraint.max, max)
        XCTAssertEqual(constraint.minMessage, minMessage)
        XCTAssertEqual(constraint.maxMessage, maxMessage)
        XCTAssertEqual(constraint.exactMessage, exactMessage)
        XCTAssertEqual(constraint.groups, groups)
    }

    func testIPType() {
        // Arrange
        let message = "This value is not a valid IP address."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        let constraint = ConstraintType.ip(message, groups: groups).constraint as! IPConstraint

        // Assert
        XCTAssertEqual(constraint.message, message)
        XCTAssertEqual(constraint.groups, groups)
    }

    func testJSONType() {
        // Arrange
        let message = "This value is not a valid JSON string."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        let constraint = ConstraintType.json(message, groups: groups).constraint as! JSONConstraint

        // Assert
        XCTAssertEqual(constraint.message, message)
        XCTAssertEqual(constraint.groups, groups)
    }

    func testLengthType() {
        // Arrange
        let min: UInt = 1
        let max: UInt = 2
        let minMessage = "This value must have \(min) characters or more."
        let maxMessage = "This value must have \(max) characters or less."
        let exactMessage = "This value must exactly have 2 characters."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        let constraint = ConstraintType.length(
            min: min,
            max: max,
            minMessage: minMessage,
            maxMessage: maxMessage,
            exactMessage: exactMessage,
            groups: groups
        ).constraint as! LengthConstraint

        // Assert
        XCTAssertEqual(constraint.min, min)
        XCTAssertEqual(constraint.max, max)
        XCTAssertEqual(constraint.minMessage, minMessage)
        XCTAssertEqual(constraint.maxMessage, maxMessage)
        XCTAssertEqual(constraint.exactMessage, exactMessage)
        XCTAssertEqual(constraint.groups, groups)
    }

    func testNotBlankType() {
        // Arrange
        let message = "This value is required."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        let constraint = ConstraintType.notBlank(message, groups: groups).constraint as! NotBlankConstraint

        // Assert
        XCTAssertEqual(constraint.message, message)
        XCTAssertEqual(constraint.groups, groups)
    }

    func testOrType() {
        // Arrange
        let groups: Set<Group> = [.default, "custom"]

        // Act
        let constraint = ConstraintType.or([.notBlank(), .length()], groups: groups).constraint as! OrConstraint

        // Assert
        XCTAssertEqual(constraint.constraints.count, 2)
        XCTAssertEqual(constraint.groups, groups)
    }

    func testRegexType() {
        // Arrange
        let pattern = "[a-zA-Z]"
        let message = "This value is not valid."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        let constraint = ConstraintType.regex(
            pattern,
            message: message,
            groups: groups
        ).constraint as! RegexConstraint

        // Assert
        XCTAssertEqual(constraint.pattern, pattern)
        XCTAssertEqual(constraint.message, message)
        XCTAssertEqual(constraint.groups, groups)
    }

    func testURLType() {
        // Arrange
        let message = "This value is not a valid URL."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        let constraint = ConstraintType.url(message, isFileURL: true, groups: groups).constraint as! URLConstraint

        // Assert
        XCTAssertTrue(constraint.isFileURL)
        XCTAssertEqual(constraint.message, message)
        XCTAssertEqual(constraint.groups, groups)
    }

    func testUUIDType() {
        // Arrange
        let message = "This value is not a valid UUID."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        let constraint = ConstraintType.uuid(message, groups: groups).constraint as! UUIDConstraint

        // Assert
        XCTAssertEqual(constraint.message, message)
        XCTAssertEqual(constraint.groups, groups)
    }

    func testVINType() {
        // Arrange
        let message = "This value is not a valid VIN."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        let constraint = ConstraintType.vin(message, groups: groups).constraint as! VINConstraint

        // Assert
        XCTAssertEqual(constraint.message, message)
        XCTAssertEqual(constraint.groups, groups)
    }
}
