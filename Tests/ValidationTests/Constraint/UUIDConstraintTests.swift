@testable import Validation
import XCTest

final class UUIDConstraintTests: XCTestCase {
    func testInit() {
        // Arrange
        let message = "This value is not a valid UUID."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        var constraint = UUIDConstraint()

        // Assert
        XCTAssertEqual(constraint.message, UUIDConstraint.message)
        XCTAssertTrue(constraint.groups.isEmpty)

        // Act
        constraint = UUIDConstraint(message, groups: groups)

        // Assert
        XCTAssertEqual(constraint.message, message)
        XCTAssertEqual(constraint.groups, groups)
    }
}
