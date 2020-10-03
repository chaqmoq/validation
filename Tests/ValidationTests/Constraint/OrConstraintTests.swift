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

        // Act
        let constraint = OrConstraint([notBlank, length])

        // Assert
        XCTAssertEqual(constraint.constraints.count, 2)
    }
}
