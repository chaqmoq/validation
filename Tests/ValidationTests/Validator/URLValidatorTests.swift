@testable import Validation
import XCTest

final class URLValidatorTests: XCTestCase {
    var validator: URLValidator!

    override func setUp() {
        super.setUp()

        validator = URLValidator()
    }

    func testEmptyValueWithImplicitConstraint() {
        // Arrange
        let value = ""

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testEmptyValueWithExplicitConstraint() {
        // Arrange
        let value = ""

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: URLConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testInvalidValueWithImplicitConstraint() {
        // Arrange
        let value = "a"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testInvalidValueWithExplicitConstraint() {
        // Arrange
        let value = "a"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: URLConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testValueWithImplicitConstraint() {
        // Arrange
        let value = "http://chaqmoq.dev"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value))
    }

    func testValuesWithExplicitConstraint() {
        // Arrange
        var value = "http://chaqmoq.dev"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value, against: URLConstraint()))

        // Arrange
        value = "file:///users/chaqmoq/logo.png"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value, against: URLConstraint(isFileURL: true)))

        // Arrange
        value = "a"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: URLConstraint(isFileURL: true))) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testValueWithInvalidConstraint() {
        // Arrange
        let value = "http://chaqmoq.dev"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: IntegerConstraint())) { error in
            XCTAssertTrue(error is Validator.Error)
        }
    }
}
