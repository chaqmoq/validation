@testable import Validation
import XCTest

final class BlankConstraintTests: XCTestCase {
    func testInit() {
        // Act
        let constraint = BlankConstraint()

        // Assert
        XCTAssertEqual(constraint.message, BlankConstraint.message)
    }

    func testInitWithCustomMessage() {
        // Arrange
        let message = "This value must be empty."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        let constraint = BlankConstraint(message, groups: groups)

        // Assert
        XCTAssertEqual(constraint.message, message)
        XCTAssertEqual(constraint.groups, groups)
    }
}
