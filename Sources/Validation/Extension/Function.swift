import Foundation

func primitive(_ value: Any?, dateFormatter: DateFormatter? = nil) -> String? {
    if value == nil {
        return ""
    } else if let string = value as? String {
        return string
    } else if let charater = value as? Character {
        return String(charater)
    } else if let int = value as? Int {
        return String(int)
    } else if let int8 = value as? Int8 {
        return String(int8)
    } else if let int16 = value as? Int16 {
        return String(int16)
    } else if let int32 = value as? Int32 {
        return String(int32)
    } else if let int64 = value as? Int64 {
        return String(int64)
    } else if let uint = value as? UInt {
        return String(uint)
    } else if let uint8 = value as? UInt8 {
        return String(uint8)
    } else if let uint16 = value as? UInt16 {
        return String(uint16)
    } else if let uint32 = value as? UInt32 {
        return String(uint32)
    } else if let uint64 = value as? UInt64 {
        return String(uint64)
    } else if let float = value as? Float {
        return String(float)
    } else if let double = value as? Double {
        return String(double)
    } else if let bool = value as? Bool {
        return String(bool)
    } else if let uuid = value as? UUID {
        return uuid.uuidString
    } else if let url = value as? URL {
        return url.absoluteString
    } else if let date = value as? Date {
        if let dateFormatter {
            return dateFormatter.string(from: date)
        }

        return DateFormatter.iso8601.string(from: date)
    }

    return nil
}

@discardableResult
func assertPrimitive(_ value: Any?, dateFormatter: DateFormatter? = nil) throws -> String {
    guard let value = primitive(value, dateFormatter: dateFormatter) else {
        let message = Validator.Error.Message.primitiveValue.text
        throw Validator.Error.invalidArgument(message)
    }

    return value
}

@discardableResult
func assertConstraintType<T: Constraint>(_ type: T.Type, for constraint: Constraint) throws -> T {
    guard let constraint = constraint as? T else {
        let message = Validator.Error.Message.constraintType(type).text
        throw Validator.Error.invalidArgument(message)
    }

    return constraint
}
