import XCTest
@testable import struct Validation.PhoneNumberConstraint

final class PhoneNumberConstraintTests: XCTestCase {
    func testInit() {
        // Act
        let constraint = PhoneNumberConstraint()

        // Assert
        XCTAssertEqual(constraint.message, "This value must be a valid phone number.")
    }
}
