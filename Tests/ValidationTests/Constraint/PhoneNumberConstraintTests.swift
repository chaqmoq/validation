@testable import Validation
import XCTest

final class PhoneNumberConstraintTests: XCTestCase {
    func testInit() {
        // Arrange
        let message = "This value is not a valid phone number."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        var constraint = PhoneNumberConstraint()

        // Assert
        XCTAssertEqual(constraint.message, PhoneNumberConstraint.message)
        XCTAssertTrue(constraint.groups.isEmpty)

        // Act
        constraint = PhoneNumberConstraint(message, groups: groups)

        // Assert
        XCTAssertEqual(constraint.message, message)
        XCTAssertEqual(constraint.groups, groups)
    }
}
