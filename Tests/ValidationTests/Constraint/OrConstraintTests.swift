@testable import Validation
import XCTest

final class OrConstraintTests: XCTestCase {
    func testInit() {
        // Act
        let constraint = OrConstraint()

        // Assert
        XCTAssertTrue(constraint.constraints.isEmpty)
        XCTAssertEqual(constraint.message, OrConstraint.message)
    }

    func testInitWithChildConstraintsAndCustomMessage() {
        // Arrange
        let notBlank = NotBlankConstraint()
        let length = LengthConstraint()
        let message = "This value doesn't satisfy any of the constraints."

        // Act
        let constraint = OrConstraint([notBlank, length], message: message)

        // Assert
        XCTAssertEqual(constraint.constraints.count, 2)
        XCTAssertEqual(constraint.message, message)
    }
}
