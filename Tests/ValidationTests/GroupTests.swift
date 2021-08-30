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
        let group1 = Group(stringLiteral: name)

        // Assert
        XCTAssertEqual(group1.name, name)

        // Act
        let group2: Group = "custom"

        // Assert
        XCTAssertEqual(group2.name, name)

        // Act
        let group3 = Group(name)

        // Assert
        XCTAssertEqual(group3.name, name)
    }
}
