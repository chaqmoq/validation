@testable import Validation
import XCTest

final class AndConstraintTests: XCTestCase {
    func testInit() {
        // Arrange
        let notBlank = NotBlankConstraint()
        let length = LengthConstraint()
        let groups: Set<Group> = [.default, "custom"]

        // Act
        var constraint = AndConstraint()

        // Assert
        XCTAssertTrue(constraint.constraints.isEmpty)

        // Act
        constraint = AndConstraint([notBlank, length], groups: groups)

        // Assert
        XCTAssertEqual(constraint.constraints.count, 2)
        XCTAssertEqual(constraint.groups, groups)
    }
}
