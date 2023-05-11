@testable import Validation
import XCTest

final class NotBlankConstraintTests: XCTestCase {
    func testInit() {
        // Arrange
        let message = "This value is required."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        var constraint = NotBlankConstraint()

        // Assert
        XCTAssertEqual(constraint.message, NotBlankConstraint.message)
        XCTAssertTrue(constraint.groups.isEmpty)

        // Act
        constraint = NotBlankConstraint(message, groups: groups)

        // Assert
        XCTAssertEqual(constraint.message, message)
        XCTAssertEqual(constraint.groups, groups)
    }
}
