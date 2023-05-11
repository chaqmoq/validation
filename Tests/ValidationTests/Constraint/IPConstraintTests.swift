@testable import Validation
import XCTest

final class IPConstraintTests: XCTestCase {
    func testInit() {
        // Arrange
        let message = "This value is not a valid IP address."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        var constraint = IPConstraint()

        // Assert
        XCTAssertEqual(constraint.message, IPConstraint.message)
        XCTAssertTrue(constraint.groups.isEmpty)

        // Act
        constraint = IPConstraint(message, groups: groups)

        // Assert
        XCTAssertEqual(constraint.message, message)
        XCTAssertEqual(constraint.groups, groups)
    }
}
