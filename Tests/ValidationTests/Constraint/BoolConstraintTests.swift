@testable import Validation
import XCTest

final class BoolConstraintTests: XCTestCase {
    func testInit() {
        // Arrange
        let message = "This value is not boolean."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        var constraint = BoolConstraint()

        // Assert
        XCTAssertEqual(constraint.message, BoolConstraint.message)
        XCTAssertTrue(constraint.groups.isEmpty)

        // Act
        constraint = BoolConstraint(message, groups: groups)

        // Assert
        XCTAssertEqual(constraint.message, message)
        XCTAssertEqual(constraint.groups, groups)
    }
}
