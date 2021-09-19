@testable import Validation
import XCTest

final class GroupSequenceTests: XCTestCase {
    func testInitWithGroups() {
        // Arrange
        let groups: [Group] = ["first", "second"]

        // Act
        let groupSequence = GroupSequence(groups)

        // Assert
        XCTAssertEqual(groupSequence.groups, groups)
    }

    func testInitWithGroupNames() {
        // Arrange
        let groupNames = ["first", "second"]

        // Act
        let groupSequence = GroupSequence(groupNames)

        // Assert
        XCTAssertEqual(groupSequence.groups, groupNames.map { Group($0) })
    }

    func testInitWithArrayLiteral() {
        // Arrange
        let groups: [Group] = ["first", "second"]

        // Act
        let groupSequence = GroupSequence(arrayLiteral: groups.first!, groups.last!)

        // Assert
        XCTAssertEqual(groupSequence.groups, groups)
    }
}
