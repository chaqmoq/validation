import XCTest
@testable import enum Validation.ValidatorError

final class ValidatorErrorTests: XCTestCase {
    func testInvalidArgumentError() {
        // Arrange
        let message = "The argument is not valid."

        // Act
        let error: ValidatorError = .invalidArgument(message)

        // Assert
        XCTAssertEqual(error.errorDescription, message)
    }
}
