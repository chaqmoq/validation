@testable import Validation
import XCTest

final class BlankConstraintTests: XCTestCase {
    func testInit() {
        // Arrange
        let message = "This value must be empty."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        var constraint = BlankConstraint()

        // Assert
        XCTAssertEqual(constraint.message, BlankConstraint.message)
        XCTAssertTrue(constraint.groups.isEmpty)

        // Act
        constraint = BlankConstraint(message, groups: groups)

        // Assert
        XCTAssertEqual(constraint.message, message)
        XCTAssertEqual(constraint.groups, groups)
    }
}
