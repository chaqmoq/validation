@testable import Validation
import XCTest

final class LengthConstraintTests: XCTestCase {
    func testInitWithExactLength() {
        // Arrange
        let value: UInt = 1

        // Act
        let constraint = LengthConstraint(exact: value)

        // Assert
        XCTAssertEqual(constraint.min, value)
        XCTAssertEqual(constraint.max, value)
        XCTAssertEqual(constraint.minMessage, String(format: LengthConstraint.minMessage, value))
        XCTAssertEqual(constraint.maxMessage, String(format: LengthConstraint.maxMessage, value))
        XCTAssertEqual(constraint.exactMessage, String(format: LengthConstraint.exactMessage, value))
        XCTAssertTrue(constraint.groups.isEmpty)
    }

    func testInitWhenMinLengthIsLessThanMaxLength() {
        // Arrange
        let min: UInt = 1
        let max: UInt = 2

        // Act
        let constraint = LengthConstraint(min: min, max: max)

        // Assert
        XCTAssertEqual(constraint.min, min)
        XCTAssertEqual(constraint.max, max)
        XCTAssertEqual(constraint.minMessage, String(format: LengthConstraint.minMessage, min))
        XCTAssertEqual(constraint.maxMessage, String(format: LengthConstraint.maxMessage, max))
        XCTAssertEqual(constraint.exactMessage, LengthConstraint.exactMessage)
        XCTAssertTrue(constraint.groups.isEmpty)
    }

    func testInitWhenMinLengthIsGreaterThanMaxLength() {
        // Arrange
        let min: UInt = 2
        let max: UInt = 1

        // Act
        let constraint = LengthConstraint(min: min, max: max)

        // Assert
        XCTAssertEqual(constraint.min, min)
        XCTAssertEqual(constraint.max, max)
        XCTAssertEqual(constraint.minMessage, String(format: LengthConstraint.minMessage, min))
        XCTAssertEqual(constraint.maxMessage, String(format: LengthConstraint.maxMessage, max))
        XCTAssertEqual(constraint.exactMessage, LengthConstraint.exactMessage)
        XCTAssertTrue(constraint.groups.isEmpty)
    }

    func testInitWhenMinLengthIsEqualToMaxLength() {
        // Arrange
        let min: UInt = 1
        let max = min

        // Act
        let constraint = LengthConstraint(min: min, max: max)

        // Assert
        XCTAssertEqual(constraint.min, min)
        XCTAssertEqual(constraint.max, max)
        XCTAssertEqual(constraint.minMessage, String(format: LengthConstraint.minMessage, min))
        XCTAssertEqual(constraint.maxMessage, String(format: LengthConstraint.maxMessage, max))
        XCTAssertEqual(constraint.exactMessage, String(format: LengthConstraint.exactMessage, min))
        XCTAssertTrue(constraint.groups.isEmpty)
    }

    func testInitWithCustomMessages() {
        // Arrange
        let min: UInt = 1
        let max: UInt = 2
        let minMessage = "This value must have \(min) characters or more."
        let maxMessage = "This value must have \(max) characters or less."
        let exactMessage = "This value must exactly have 2 characters."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        let constraint = LengthConstraint(
            min: min,
            max: max,
            minMessage: minMessage,
            maxMessage: maxMessage,
            exactMessage: exactMessage,
            groups: groups
        )

        // Assert
        XCTAssertEqual(constraint.minMessage, minMessage)
        XCTAssertEqual(constraint.maxMessage, maxMessage)
        XCTAssertEqual(constraint.exactMessage, exactMessage)
        XCTAssertEqual(constraint.groups, groups)
    }
}
