@testable import Validation
import XCTest

final class FunctionTests: XCTestCase {
    let nilValue: String? = nil
    let string = "string"
    let character: Character = "c"
    let int = 1
    let int8: Int8 = 2
    let int16: Int16 = 3
    let int32: Int32 = 4
    let int64: Int64 = 5
    let uint: UInt = 6
    let uint8: UInt8 = 7
    let uint16: UInt16 = 8
    let uint32: UInt32 = 9
    let uint64: UInt64 = 10
    let float: Float = 11.5
    let double: Double = 12.5
    let bool = true
    let array: [String] = .init()

    func testPrimitive() {
        XCTAssertEqual(primitive(nilValue), "")
        XCTAssertEqual(primitive(string), string)
        XCTAssertEqual(primitive(character), String(character))
        XCTAssertEqual(primitive(int), String(int))
        XCTAssertEqual(primitive(int8), String(int8))
        XCTAssertEqual(primitive(int16), String(int16))
        XCTAssertEqual(primitive(int32), String(int32))
        XCTAssertEqual(primitive(int64), String(int64))
        XCTAssertEqual(primitive(uint), String(uint))
        XCTAssertEqual(primitive(uint8), String(uint8))
        XCTAssertEqual(primitive(uint16), String(uint16))
        XCTAssertEqual(primitive(uint32), String(uint32))
        XCTAssertEqual(primitive(uint64), String(uint64))
        XCTAssertEqual(primitive(float), String(float))
        XCTAssertEqual(primitive(double), String(double))
        XCTAssertEqual(primitive(bool), String(bool))
        XCTAssertNil(primitive(array))
    }
}
