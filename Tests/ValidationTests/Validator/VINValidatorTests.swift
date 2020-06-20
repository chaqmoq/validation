import XCTest
@testable import Validation

final class VINValidatorTests: XCTestCase {
    var validator: ConstraintValidator!

    override func setUp() {
        super.setUp()

        validator = VINValidator()
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

        // Assert
        for vin in vins {
            XCTAssertNoThrow(try validator.validate(vin))
        }
    }

    func testInvalidVINs() {
        // Arrange
        var vin = "1G1BE5SMXG7234868"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(vin)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }

        // Arrange
        vin = "1G1BE5SM4G7235868"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(vin)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testInvalidCharacterVINs() {
        // Arrange
        var vin = "1G1BE5SM4GI234868"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(vin)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }

        // Arrange
        vin = "1G1BE5SM4G7234O68"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(vin)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }

        // Arrange
        vin = "1G1BQ5SM4G7234868"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(vin)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }

        // Arrange
        vin = "1G1BE5SM4G723 868"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(vin)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }

        // Arrange
        vin = "SAFETKBUNPEANDTHS"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(vin)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }

        // Arrange
        vin = "1G1BE5S-4G7234868"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(vin)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }

        // Arrange
        vin = "INI503779(C0NTENT"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(vin)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }

        // Arrange
        vin = "SEEHTTPS7ELLEN.WI"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(vin)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }

        // Arrange
        vin = "CAPTUREC0NNECTI0N"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(vin)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }

    func testInvalidLengthVINs() {
        // Arrange
        var vin = "1G1BE5SM4G723486"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(vin)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }

        // Arrange
        vin = "1G1BE5SM4G7234862828"

        // Act/Assert
        XCTAssertThrowsError(try validator.validate(vin)) { error in
            XCTAssertTrue(error is ConstraintViolation)
        }
    }
}
