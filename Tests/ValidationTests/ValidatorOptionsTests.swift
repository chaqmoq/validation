@testable import Validation
import XCTest

final class ValidatorOptionsTests: XCTestCase {
    func testInit() {
        // Act
        let option = Validator.Options(rawValue: 1)

        // Assert
        XCTAssertEqual(option, Validator.Options.strict)
    }
}
