import XCTest
@testable import struct Validation.LengthConstraint

final class LengthConstraintTests: XCTestCase {
    func testInitWithExactLength() {
        // Arrange
        let value: UInt = 1

        // Act
        let constraint = LengthConstraint(exact: value)

        // Assert
        XCTAssertEqual(constraint.min, value)
        XCTAssertEqual(constraint.max, value)
        XCTAssertEqual(constraint.minMessage, "This value is too short. It must have \(value) characters or more.")
        XCTAssertEqual(constraint.maxMessage, "This value is too long. It must have \(value) characters or less.")
        XCTAssertEqual(constraint.exactMessage, "This value must have \(value) characters.")
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
        XCTAssertEqual(constraint.minMessage, "This value is too short. It must have \(min) characters or more.")
        XCTAssertEqual(constraint.maxMessage, "This value is too long. It must have \(max) characters or less.")
        XCTAssertEqual(constraint.exactMessage, "This value must have %d characters.")
    }

    func testInitWhenMinLengthIsMoreThanMaxLength() {
        // Arrange
        let min: UInt = 2
        let max: UInt = 1

        // Act
        let constraint = LengthConstraint(min: min, max: max)

        // Assert
        XCTAssertEqual(constraint.min, min)
        XCTAssertEqual(constraint.max, max)
        XCTAssertEqual(constraint.minMessage, "This value is too short. It must have \(min) characters or more.")
        XCTAssertEqual(constraint.maxMessage, "This value is too long. It must have \(max) characters or less.")
        XCTAssertEqual(constraint.exactMessage, "This value must have %d characters.")
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
        XCTAssertEqual(constraint.minMessage, "This value is too short. It must have \(min) characters or more.")
        XCTAssertEqual(constraint.maxMessage, "This value is too long. It must have \(min) characters or less.")
        XCTAssertEqual(constraint.exactMessage, "This value must have \(min) characters.")
    }
}
