@testable import Validation
import XCTest

final class AndConstraintTests: XCTestCase {
    func testInit() {
        // Act
        let constraint = AndConstraint()

        // Assert
        XCTAssertTrue(constraint.constraints.isEmpty)
    }

    func testInitWithChildConstraints() {
        // Arrange
        let notBlank = NotBlankConstraint()
        let length = LengthConstraint()
        let groups: Set<Group> = [.default, "custom"]

        // Act
        let constraint = AndConstraint([notBlank, length], groups: groups)

        // Assert
        XCTAssertEqual(constraint.constraints.count, 2)
        XCTAssertEqual(constraint.groups, groups)
    }
}
