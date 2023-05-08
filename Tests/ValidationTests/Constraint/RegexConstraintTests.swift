@testable import Validation
import XCTest

final class RegexConstraintTests: XCTestCase {
    func testInit() {
        // Act
        let constraint = RegexConstraint()

        // Assert
        XCTAssertEqual(constraint.message, RegexConstraint.message)
    }

    func testInitWithCustomMessage() {
        // Arrange
        let pattern = "[a-zA-Z]"
        let message = "This value is not valid."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        let constraint = RegexConstraint(pattern, message: message, groups: groups)

        // Assert
        XCTAssertEqual(constraint.pattern, pattern)
        XCTAssertEqual(constraint.message, message)
        XCTAssertEqual(constraint.groups, groups)
    }
}
