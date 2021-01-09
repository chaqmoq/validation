@testable import Validation
import XCTest

final class URLConstraintTests: XCTestCase {
    func testInit() {
        // Act
        let constraint = URLConstraint()

        // Assert
        XCTAssertFalse(constraint.isFileURL)
        XCTAssertEqual(constraint.message, URLConstraint.message)
    }

    func testInitWithIsFileFlagAndCustomMessage() {
        // Arrange
        let message = "This value is not a valid URL."
        let groups: Set<Group> = [.default, "custom"]

        // Act
        let constraint = URLConstraint(message, isFileURL: true, groups: groups)

        // Assert
        XCTAssertTrue(constraint.isFileURL)
        XCTAssertEqual(constraint.message, message)
        XCTAssertEqual(constraint.groups, groups)
    }
}
