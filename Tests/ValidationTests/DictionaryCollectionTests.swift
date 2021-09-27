@testable import Validation
import XCTest

final class DictionaryCollectionTests: XCTestCase {
    func testInit() {
        // Act
        let constraintCollection = DictionaryCollection<Constraint>()

        // Assert
        XCTAssertTrue(constraintCollection.isEmpty)
    }

    func testSetGet() {
        // Arrange
        var constraintCollection = DictionaryCollection<Constraint>(
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
