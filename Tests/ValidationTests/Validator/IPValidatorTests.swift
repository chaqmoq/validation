@testable import Validation
import XCTest

final class IPValidatorTests: XCTestCase {
    var validator: IPValidator!

    override func setUp() {
        super.setUp()

        validator = IPValidator()
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
        XCTAssertThrowsError(try validator.validate(value, against: IPConstraint())) { error in
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
        XCTAssertThrowsError(try validator.validate(value, against: IPConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testValuesAgainstImplicitConstraint() {
        // Arrange
        let values: [String] = [
            "1.1.1.1",
            "255.255.255.255",
            "192.168.1.1",
            "10.10.1.1",
            "132.254.111.10",
            "26.10.2.10",
            "127.0.0.1"
        ]

        // Act/Assert
        for value in values {
            XCTAssertNoThrow(try validator.validate(value))
        }
    }

    func testValueAgainstExplicitConstraint() {
        // Arrange
        let values: [String] = [
            "1.1.1.1",
            "255.255.255.255",
            "192.168.1.1",
            "10.10.1.1",
            "132.254.111.10",
            "26.10.2.10",
            "127.0.0.1"
        ]

        // Act/Assert
        for value in values {
            XCTAssertNoThrow(try validator.validate(value, against: IPConstraint()))
        }
    }

    func testInvalidValuesAgainstImplicitConstraint() {
        // Arrange
        let values: [String] = [
            "10.10.10",
            "10.10",
            "10",
            "a.a.a.a",
            "10.0.0.a",
            "10.10.10.256",
            "222.222.2.999",
            "999.10.10.20",
            "2222.22.22.22",
            "22.2222.22.2"
        ]

        // Act/Assert
        for value in values {
            XCTAssertThrowsError(try validator.validate(value)) { error in
                XCTAssertTrue(error is ConstraintViolation)
            }
        }
    }

    func testInvalidValuesAgainstExplicitConstraint() {
        // Arrange
        let values: [String] = [
            "10.10.10",
            "10.10",
            "10",
            "a.a.a.a",
            "10.0.0.a",
            "10.10.10.256",
            "222.222.2.999",
            "999.10.10.20",
            "2222.22.22.22",
            "22.2222.22.2"
        ]

        // Act/Assert
        for value in values {
            XCTAssertThrowsError(try validator.validate(value, against: IPConstraint())) { error in
                XCTAssertTrue(error is ConstraintViolation)
            }
        }
    }

    func testValueWithInvalidConstraint() {
        // Arrange
        let value = "1.1.1.1"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: IntegerConstraint())) { error in
            XCTAssertTrue(error is Validator.Error)
        }
    }
}
