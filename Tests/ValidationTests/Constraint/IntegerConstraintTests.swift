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

    func testInitWhenMinValueIsLessThanMaxValue() {
        // Arrange
        let min: Int = 1
        let max: Int = 2

        // Act
        let constraint = IntegerConstraint(min: min, max: max)

        // Assert
        XCTAssertEqual(constraint.min, min)
        XCTAssertEqual(constraint.max, max)
        XCTAssertEqual(constraint.minMessage, "This value is too small. It must be greater than or equal to \(min).")
        XCTAssertEqual(constraint.maxMessage, "This value is too big. It must be less than or equal to \(max).")
        XCTAssertEqual(constraint.exactMessage, "This value must be %d.")
    }
}
