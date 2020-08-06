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

        // Act
        let constraint = URLConstraint(isFileURL: true, message: message)

        // Assert
        XCTAssertTrue(constraint.isFileURL)
        XCTAssertEqual(constraint.message, message)
    }
}
