@testable import Validation
import XCTest

final class VINConstraintTests: XCTestCase {
    func testInit() {
        // Arrange
        let message = "This value is not a valid VIN."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        var constraint = VINConstraint()

        // Assert
        XCTAssertEqual(constraint.message, VINConstraint.message)
        XCTAssertTrue(constraint.groups.isEmpty)

        // Act
        constraint = VINConstraint(message, groups: groups)

        // Assert
        XCTAssertEqual(constraint.message, message)
        XCTAssertEqual(constraint.groups, groups)
    }
}
