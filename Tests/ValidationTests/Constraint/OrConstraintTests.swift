@testable import Validation
import XCTest

final class OrConstraintTests: XCTestCase {
    func testInit() {
        // Act
        let constraint = OrConstraint()

        // Assert
        XCTAssertTrue(constraint.constraints.isEmpty)
    }

    func testInitWithChildConstraintsAndCustomMessage() {
        // Arrange
        let notBlank = NotBlankConstraint()
        let length = LengthConstraint()
        let groups: Set<Group> = [.default, "custom"]

        // Act
        let constraint = OrConstraint([notBlank, length], groups: groups)

        // Assert
        XCTAssertEqual(constraint.constraints.count, 2)
        XCTAssertEqual(constraint.groups, groups)
    }
}
