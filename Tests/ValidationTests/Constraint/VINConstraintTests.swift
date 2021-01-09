@testable import Validation
import XCTest

final class VINConstraintTests: XCTestCase {
    func testInit() {
        // Act
        let constraint = VINConstraint()

        // Assert
        XCTAssertEqual(constraint.message, VINConstraint.message)
    }

    func testInitWithCustomMessage() {
        // Arrange
        let message = "This value is not a valid VIN."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        let constraint = VINConstraint(message, groups: groups)

        // Assert
        XCTAssertEqual(constraint.message, message)
        XCTAssertEqual(constraint.groups, groups)
    }
}
