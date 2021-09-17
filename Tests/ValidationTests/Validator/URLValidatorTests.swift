@testable import Validation
import XCTest

final class URLValidatorTests: XCTestCase {
    var validator: URLValidator!

    override func setUp() {
        super.setUp()

        validator = URLValidator()
    }

    func testNilValueAgainstImplicitConstraint() {
        // Arrange
        let value: String? = nil

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testNilValueAgainstExplicitConstraint() {
        // Arrange
        let value: String? = nil

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: URLConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testEmptyValueAgainstImplicitConstraint() {
        // Arrange
        let value = ""

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testEmptyValueAgainstExplicitConstraint() {
        // Arrange
        let value = ""

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: URLConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testInvalidValueAgainstImplicitConstraint() {
        // Arrange
        let value = "a"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testInvalidValueAgainstExplicitConstraint() {
        // Arrange
        let value = "a"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: URLConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testValueAgainstImplicitConstraint() {
        // Arrange
        let value = "http://chaqmoq.dev"

        // Act/Assert
        XCTAssertNoThrow(try validator.validate(value))
    }

    func testValuesAgainstExplicitConstraint() {
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
