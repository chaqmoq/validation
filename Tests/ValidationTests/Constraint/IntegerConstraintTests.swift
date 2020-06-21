import XCTest
@testable import struct Validation.IntegerConstraint

final class IntegerConstraintTests: XCTestCase {
    func testInitWithExactValue() {
        // Arrange
        let value = 1

        // Act
        let constraint = IntegerConstraint(exact: value)

        // Assert
        XCTAssertEqual(constraint.min, value)
        XCTAssertEqual(constraint.max, value)
        XCTAssertEqual(constraint.minMessage, "This value is too small. It must be greater than or equal to \(value).")
        XCTAssertEqual(constraint.maxMessage, "This value is too big. It must be less than or equal to \(value).")
        XCTAssertEqual(constraint.exactMessage, "This value must be \(value).")
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
        XCTAssertEqual(constraint.minMessage, "This value is too small. It must be greater than or equal to \(min).")
        XCTAssertEqual(constraint.maxMessage, "This value is too big. It must be less than or equal to \(max).")
        XCTAssertEqual(constraint.exactMessage, "This value must be %d.")
    }

    func testInitWhenMinValueIsMoreThanMaxValue() {
        // Arrange
        let min = 2
        let max = 1

        // Act
        let constraint = IntegerConstraint(min: min, max: max)

        // Assert
        XCTAssertEqual(constraint.min, min)
        XCTAssertEqual(constraint.max, max)
        XCTAssertEqual(constraint.minMessage, "This value is too small. It must be greater than or equal to \(min).")
        XCTAssertEqual(constraint.maxMessage, "This value is too big. It must be less than or equal to \(max).")
        XCTAssertEqual(constraint.exactMessage, "This value must be %d.")
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
        XCTAssertEqual(constraint.minMessage, "This value is too small. It must be greater than or equal to \(min).")
        XCTAssertEqual(constraint.maxMessage, "This value is too big. It must be less than or equal to \(max).")
        XCTAssertEqual(constraint.exactMessage, "This value must be \(min).")
    }

    func testInitWithCustomMessages() {
        // Arrange
        let min = 1
        let max = 2
        let minMessage = "This value must have \(min) characters or more."
        let maxMessage = "This value must have \(max) characters or less."
        let exactMessage = "This value must exactly have 2 characters."

        // Act
        let constraint = IntegerConstraint(
            min: min,
            max: max,
            minMessage: minMessage,
            maxMessage: maxMessage,
            exactMessage: exactMessage
        )

        // Assert
        XCTAssertEqual(constraint.minMessage, minMessage)
        XCTAssertEqual(constraint.maxMessage, maxMessage)
        XCTAssertEqual(constraint.exactMessage, exactMessage)
    }
}
