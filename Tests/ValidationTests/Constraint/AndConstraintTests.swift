@testable import Validation
import XCTest

final class AndConstraintTests: XCTestCase {
    func testInit() {
        // Act
        let constraint = AndConstraint()

        // Assert
        XCTAssertTrue(constraint.constraints.isEmpty)
    }

    func testInitWithChildConstraints() {
        // Arrange
        let notBlank = NotBlankConstraint()
        let length = LengthConstraint()

        // Act
        let constraint = AndConstraint([notBlank, length])

        // Assert
        XCTAssertEqual(constraint.constraints.count, 2)
    }
}
