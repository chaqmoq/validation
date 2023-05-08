@testable import Validation
import XCTest

final class RegexValidatorTests: XCTestCase {
    var validator: RegexValidator!

    override func setUp() {
        super.setUp()

        validator = RegexValidator()
    }
}
