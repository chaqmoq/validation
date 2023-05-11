@testable import Validation
import XCTest

final class OrConstraintTests: XCTestCase {
    func testInit() {
        // Arrange
        let notBlank = NotBlankConstraint()
        let length = LengthConstraint()
        let groups: Set<Group> = [.default, "custom"]

        // Act
        var constraint = OrConstraint()

        // Assert
        XCTAssertTrue(constraint.constraints.isEmpty)
        XCTAssertTrue(constraint.groups.isEmpty)

        // Act
        constraint = OrConstraint([notBlank, length], groups: groups)

        // Assert
        XCTAssertEqual(constraint.constraints.count, 2)
        XCTAssertEqual(constraint.groups, groups)
    }
}
