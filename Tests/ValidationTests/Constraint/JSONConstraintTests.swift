@testable import Validation
import XCTest

final class JSONConstraintTests: XCTestCase {
    func testInit() {
        // Arrange
        let message = "This value is not a valid JSON string."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        var constraint = JSONConstraint()

        // Assert
        XCTAssertEqual(constraint.message, JSONConstraint.message)
        XCTAssertTrue(constraint.groups.isEmpty)

        // Act
        constraint = JSONConstraint(message, groups: groups)

        // Assert
        XCTAssertEqual(constraint.message, message)
        XCTAssertEqual(constraint.groups, groups)
    }
}
