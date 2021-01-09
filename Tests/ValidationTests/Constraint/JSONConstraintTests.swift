@testable import Validation
import XCTest

final class JSONConstraintTests: XCTestCase {
    func testInit() {
        // Act
        let constraint = JSONConstraint()

        // Assert
        XCTAssertEqual(constraint.message, JSONConstraint.message)
    }

    func testInitWithCustomMessage() {
        // Arrange
        let message = "This value is not a valid JSON string."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        let constraint = JSONConstraint(message, groups: groups)

        // Assert
        XCTAssertEqual(constraint.message, message)
        XCTAssertEqual(constraint.groups, groups)
    }
}
