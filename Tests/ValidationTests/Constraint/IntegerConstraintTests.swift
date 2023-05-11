@testable import Validation
import XCTest

final class IntegerConstraintTests: XCTestCase {
    func testInitWithExactValue() {
        // Arrange
        let value = 1

        // Act
        let constraint = IntegerConstraint(exact: value)

        // Assert
        XCTAssertEqual(constraint.min, value)
        XCTAssertEqual(constraint.max, value)
        XCTAssertEqual(constraint.minMessage, String(format: IntegerConstraint.minMessage, value))
        XCTAssertEqual(constraint.maxMessage, String(format: IntegerConstraint.maxMessage, value))
        XCTAssertEqual(constraint.exactMessage, String(format: IntegerConstraint.exactMessage, value))
    }

    func testInitWhenMinValueIsLessThanMaxValue() {
        // Arrange
        let min = 1
        let max = 2

        // Act
        let constraint = IntegerConstraint(min: min, max: max)

        // Assert
        XCTAssertEqual(constraint.min, min)
        XCTAssertEqual(constraint.max, max)
        XCTAssertEqual(constraint.minMessage, String(format: IntegerConstraint.minMessage, min))
        XCTAssertEqual(constraint.maxMessage, String(format: IntegerConstraint.maxMessage, max))
        XCTAssertEqual(constraint.exactMessage, IntegerConstraint.exactMessage)
    }

    func testInitWhenMinValueIsGreaterThanMaxValue() {
        // Arrange
        let min = 2
        let max = 1

        // Act
        let constraint = IntegerConstraint(min: min, max: max)

        // Assert
        XCTAssertEqual(constraint.min, min)
        XCTAssertEqual(constraint.max, max)
        XCTAssertEqual(constraint.minMessage, String(format: IntegerConstraint.minMessage, min))
        XCTAssertEqual(constraint.maxMessage, String(format: IntegerConstraint.maxMessage, max))
        XCTAssertEqual(constraint.exactMessage, IntegerConstraint.exactMessage)
    }

    func testInitWhenMinValueIsEqualToMaxValue() {
        // Arrange
        let min = 1
        let max = min

        // Act
        let constraint = IntegerConstraint(min: min, max: max)

        // Assert
        XCTAssertEqual(constraint.min, min)
        XCTAssertEqual(constraint.max, max)
        XCTAssertEqual(constraint.minMessage, String(format: IntegerConstraint.minMessage, min))
        XCTAssertEqual(constraint.maxMessage, String(format: IntegerConstraint.maxMessage, max))
        XCTAssertEqual(constraint.exactMessage, String(format: IntegerConstraint.exactMessage, min))
    }

    func testInitWithCustomMessages() {
        // Arrange
        let min = 1
        let max = 2
        let minMessage = "This value must have \(min) characters or more."
        let maxMessage = "This value must have \(max) characters or less."
        let exactMessage = "This value must exactly have 2 characters."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        let constraint = IntegerConstraint(
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
