import Foundation

func primitive(_ value: Any?, dateFormatter: DateFormatter? = nil) -> String? {
    if value == nil {
        return ""
    } else if let value = value as? String {
        return value
    } else if let value = value as? Character {
        return String(value)
    } else if let value = value as? Int {
        return String(value)
    } else if let value = value as? Int8 {
        return String(value)
    } else if let value = value as? Int16 {
        return String(value)
    } else if let value = value as? Int32 {
        return String(value)
    } else if let value = value as? Int64 {
        return String(value)
    } else if let value = value as? UInt {
        return String(value)
    } else if let value = value as? UInt8 {
        return String(value)
    } else if let value = value as? UInt16 {
        return String(value)
    } else if let value = value as? UInt32 {
        return String(value)
    } else if let value = value as? UInt64 {
        return String(value)
    } else if let value = value as? Float {
        return String(value)
    } else if let value = value as? Double {
        return String(value)
    } else if let value = value as? Bool {
        return String(value)
    } else if let value = value as? UUID {
        return value.uuidString
    } else if let value = value as? URL {
        return value.absoluteString
    } else if let value = value as? Date {
        if let dateFormatter {
            return dateFormatter.string(from: value)
        }

        return ISO8601DateFormatter().string(from: value)
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
