@testable import Validation
import XCTest

final class ChoiceConstraintTests: XCTestCase {
    func testInit() {
        // Arrange
        let choices = ["first", "second", "third"]
        let message = "This value is not a valid choice."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        var constraint = ChoiceConstraint()

        // Assert
        XCTAssertEqual(constraint.message, ChoiceConstraint.message)

        // Act
        constraint = ChoiceConstraint(choices, message: message, groups: groups)

        // Assert
        XCTAssertEqual(constraint.choices as? [String], choices)
        XCTAssertEqual(constraint.message, message)
        XCTAssertEqual(constraint.groups, groups)
    }
}
