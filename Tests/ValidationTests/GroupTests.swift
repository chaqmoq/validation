@testable import Validation
import XCTest

final class GroupTests: XCTestCase {
    func testDefault() {
        // Assert
        XCTAssertEqual(Group.default, "default")
    }

    func testInit() {
        // Arrange
        let name = "custom"

        // Act
        let group = Group(stringLiteral: name)

        // Assert
        XCTAssertEqual(group.name, name)
    }
}
