import XCTest
@testable import struct Validation.IntegerConstraint

final class IntegerConstraintTests: XCTestCase {
    func testInitWithExactValue() {
        // Arrange
        let value: Int = 1

        // Act
        let constraint = IntegerConstraint(exact: value)

        // Assert
        XCTAssertEqual(constraint.min, value)
        XCTAssertEqual(constraint.max, value)
        XCTAssertEqual(constraint.minMessage, "This value is too small. It must be greater than or equal to \(value).")
        XCTAssertEqual(constraint.maxMessage, "This value is too big. It must be less than or equal to \(value).")
        XCTAssertEqual(constraint.exactMessage, "This value must be \(value).")
    }
}
