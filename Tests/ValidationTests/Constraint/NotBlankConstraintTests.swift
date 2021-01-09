@testable import Validation
import XCTest

final class NotBlankConstraintTests: XCTestCase {
    func testInit() {
        // Act
        let constraint = NotBlankConstraint()

        // Assert
        XCTAssertEqual(constraint.message, NotBlankConstraint.message)
    }

    func testInitWithCustomMessage() {
        // Arrange
        let message = "This value is required."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        let constraint = NotBlankConstraint(message: message, groups: groups)

        // Assert
        XCTAssertEqual(constraint.message, message)
        XCTAssertEqual(constraint.groups, groups)
    }
}
