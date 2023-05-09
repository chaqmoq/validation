@testable import Validation
import XCTest

final class DateConstraintTests: XCTestCase {
    func testInit() {
        // Arrange
        let dateFormatter = DateFormatter()
        let message = "This value is not a valid date."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        var constraint = DateConstraint()

        // Assert
        XCTAssertEqual(constraint.message, DateConstraint.message)
        XCTAssertTrue(constraint.groups.isEmpty)

        // Act
        constraint = DateConstraint(message: message, groups: groups)

        // Assert
        XCTAssertEqual(constraint.message, message)
        XCTAssertEqual(constraint.groups, groups)

        // Act
        constraint = DateConstraint(dateFormatter, message: message, groups: groups)

        // Assert
        XCTAssertEqual(constraint.dateFormatter, dateFormatter)
        XCTAssertEqual(constraint.message, message)
        XCTAssertEqual(constraint.groups, groups)
    }
}
