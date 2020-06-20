import XCTest
@testable import struct Validation.VINConstraint

final class VINConstraintTests: XCTestCase {
    func testInit() {
        // Act
        let constraint = VINConstraint()

        // Assert
        XCTAssertEqual(constraint.message, "This value must be a valid VIN.")
    }
}
