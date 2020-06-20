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
}
