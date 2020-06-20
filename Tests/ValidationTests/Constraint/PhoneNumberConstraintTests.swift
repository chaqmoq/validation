import XCTest
@testable import struct Validation.PhoneNumberConstraint

final class PhoneNumberConstraintTests: XCTestCase {
    func testInit() {
        // Act
        let constraint = PhoneNumberConstraint()

        // Assert
        XCTAssertEqual(constraint.message, "This value must be a valid phone number.")
    }

    func testInitWithCustomMessageAndRegionCode() {
        // Arrange
        let message = "This value must be a valid phone number with (+998) region code."
        let regionCode = "UZ"

        // Act
        let constraint = PhoneNumberConstraint(message: message, regionCode: regionCode)

        // Assert
        XCTAssertEqual(constraint.message, message)
        XCTAssertEqual(constraint.regionCode, regionCode)
    }
}
