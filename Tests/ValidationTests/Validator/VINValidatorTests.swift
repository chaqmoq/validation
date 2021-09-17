@testable import Validation
import XCTest

final class VINValidatorTests: XCTestCase {
    var validator: VINValidator!

    override func setUp() {
        super.setUp()

        validator = VINValidator()
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
        XCTAssertThrowsError(try validator.validate(value, against: VINConstraint())) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testValidVINs() {
        // Arrange
        let vins = [
            "I1G1BE5SM4G7234868",
            "I1G1ZD5ST9JF145142",
            "WBANE53517CK92498",
            "1G1BE5SM4G7234868",
            "1G1ZD5ST9JF145142",
            "1GTV2LEC5GZ171806",
            "1NXBR32E17Z833944",
            "4T1B11HK5JU122375",
            "1VWCP7A32DC077559",
            "2GKFLUEK3H6321895",
            "1G1ZD5ST0JF173363",
            "1GNKVHKD5HJ295716",
            "2G1125S33J9135816",
            "1J4FY19P0VP397663",
            "JTMZFREV0DD081109",
            "1FTRF3CT0BEB48796",
            "5NPDH4AE0DH396127",
            "JN1AZ0CP6CT023453"
        ]

        // Act/Assert
        for vin in vins {
            XCTAssertNoThrow(try validator.validate(vin))
        }
    }

    func testInvalidVINs() {
        // Arrange
        let vins = [
            "1G1BE5SMXG7234868",
            "1G1BE5SM4G7235868"
        ]

        // Act/Assert
        for vin in vins {
            XCTAssertThrowsError(try validator.validate(vin)) { error in
                XCTAssertTrue(error is ConstraintViolation)
            }
        }
    }

    func testInvalidCharacterVINs() {
        // Arrange
        let vins = [
            "1G1BE5SM4GI234868",
            "1G1BE5SM4G7234O68",
            "1G1BQ5SM4G7234868",
            "1G1BE5SM4G723 868",
            "SAFETKBUNPEANDTHS",
            "1G1BE5S-4G7234868",
            "INI503779(C0NTENT",
            "SEEHTTPS7ELLEN.WI",
            "CAPTUREC0NNECTI0N"
        ]

        // Act/Assert
        for vin in vins {
            XCTAssertThrowsError(try validator.validate(vin)) { error in
                XCTAssertTrue(error is ConstraintViolation)
            }
        }
    }

    func testInvalidLengthVINs() {
        // Arrange
        let vins = [
            "1G1BE5SM4G723486",
            "1G1BE5SM4G7234862828"
        ]

        // Act/Assert
        for vin in vins {
            XCTAssertThrowsError(try validator.validate(vin)) { error in
                XCTAssertTrue(error is ConstraintViolation)
            }
        }
    }

    func testValueWithInvalidConstraint() {
        // Arrange
        let value = "I1G1BE5SM4G7234868"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(value, against: IntegerConstraint())) { error in
            XCTAssertTrue(error is Validator.Error)
        }
    }
}
