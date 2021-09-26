@testable import Validation
import XCTest

final class ConstraintCollectionTests: XCTestCase {
    func testInit() {
        // Act
        let constraintCollection = ConstraintCollection()

        // Assert
        XCTAssertTrue(constraintCollection.isEmpty)
    }

    func testSetGet() {
        // Arrange
        var constraintCollection = ConstraintCollection(
            [
                "firstName": [NotBlankConstraint(), LengthConstraint(min: 2)]
            ]
        )

        // Assert
        XCTAssertEqual(constraintCollection.count, 1)
        XCTAssertEqual(constraintCollection["firstName"].count, 2)
        XCTAssertTrue(constraintCollection["email"].isEmpty)

        // Act
        constraintCollection["email"] = [NotBlankConstraint(), EmailConstraint()]

        // Assert
        XCTAssertEqual(constraintCollection.count, 2)
        XCTAssertEqual(constraintCollection["firstName"].count, 2)
        XCTAssertEqual(constraintCollection["email"].count, 2)
    }
}
