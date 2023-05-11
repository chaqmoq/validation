@testable import Validation
import XCTest

final class IPValidatorTests: XCTestCase {
    var validator: IPValidator!

    override func setUp() {
        super.setUp()

        validator = IPValidator()
    }

    func testValidate() {
        // Arrange
        let nilValue: String? = nil
        let emptyValue = ""
        let values: [String] = [
            "1.1.1.1",
            "255.255.255.255",
            "192.168.1.1",
            "10.10.1.1",
            "132.254.111.10",
            "26.10.2.10",
            "127.0.0.1"
        ]
        let invalidValues: [String] = [
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
        XCTAssertThrowsError(try validator.validate(nilValue)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(nilValue, against: IPConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(emptyValue)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
        XCTAssertThrowsError(try validator.validate(emptyValue, against: IPConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }

        for value in values {
            XCTAssertNoThrow(try validator.validate(value))
            XCTAssertNoThrow(try validator.validate(value, against: IPConstraint()))
            XCTAssertThrowsError(try validator.validate(value, against: IntegerConstraint())) { error in
                XCTAssertTrue(error is Validator.Error)
            }
        }

        for invalidValue in invalidValues {
            XCTAssertThrowsError(try validator.validate(invalidValue)) { error in
                XCTAssertTrue(error is ConstraintViolation)
            }
            XCTAssertThrowsError(try validator.validate(invalidValue, against: IPConstraint())) { error in
                XCTAssertTrue(error is ConstraintViolation)
            }
        }
    }
}
