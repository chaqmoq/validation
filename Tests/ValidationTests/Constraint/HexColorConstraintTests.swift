@testable import Validation
import XCTest

final class HexColorConstraintTests: XCTestCase {
    func testInit() {
        // Arrange
        let message = "This value is not a valid hex color."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        var constraint = HexColorConstraint()

        // Assert
        XCTAssertEqual(constraint.message, HexColorConstraint.message)
        XCTAssertTrue(constraint.groups.isEmpty)

        // Act
        constraint = HexColorConstraint(message, groups: groups)

        // Assert
        XCTAssertEqual(constraint.message, message)
        XCTAssertEqual(constraint.groups, groups)
    }
}
