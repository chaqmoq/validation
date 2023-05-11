@testable import Validation
import XCTest

final class EmailConstraintTests: XCTestCase {
    func testInit() {
        // Arrange
        let message = "This value is not a valid email address."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        var constraint = EmailConstraint()

        // Assert
        XCTAssertEqual(constraint.message, EmailConstraint.message)
        XCTAssertTrue(constraint.groups.isEmpty)

        // Act
        constraint = EmailConstraint(message, groups: groups)

        // Assert
        XCTAssertEqual(constraint.message, message)
        XCTAssertEqual(constraint.groups, groups)
    }
}
