@testable import Validation
import XCTest

final class URLValidatorTests: XCTestCase {
    var validator: URLValidator!

    override func setUp() {
        super.setUp()

        validator = URLValidator()
    }

    func testValidate() {
        // Arrange
        let nilValue: String? = nil
        let emptyValue = ""
        let invalidValue = "a"
        let url = "http://chaqmoq.dev"
        let fileURL = "file:///users/chaqmoq/logo.png"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(nilValue)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(nilValue, against: URLConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(emptyValue)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(emptyValue, against: URLConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(invalidValue)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(invalidValue, against: URLConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(invalidValue, against: URLConstraint(isFileURL: true))) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertNoThrow(try validator.validate(url))
        XCTAssertNoThrow(try validator.validate(url, against: URLConstraint()))
        XCTAssertThrowsError(try validator.validate(url, against: IntegerConstraint())) { error in
            XCTAssertTrue(error is Validator.Error)
        }
        XCTAssertNoThrow(try validator.validate(fileURL, against: URLConstraint(isFileURL: true)))
    }
}
