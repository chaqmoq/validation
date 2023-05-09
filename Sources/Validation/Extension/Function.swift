import Foundation

/// Converts a primitive value to its `String` representation.
///
/// - Parameter value: A primitive value.
/// - Returns: A `String` representation of the value or `nil` if it can't be convert to `String`.
public func primitive(_ value: Any?) -> String? {
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
    }

    return nil
}

/// Converts a primitive value to its `String` representation or throws a `Validator.Error`.
///
/// - Parameter value: A primitive value.
/// - Throws: A `Validator.Error`  if the value can't be convert to `String`.
/// - Returns: A `String` representation of the value.
@discardableResult
public func assertPrimitive(_ value: Any?) throws -> String {
    guard let value = primitive(value) else {
        let message = Validator.Error.Message.primitiveValue.text
        throw Validator.Error.invalidArgument(message)
    }

    return value
}

/// Converts a `Constraint` to a certain concrete type or throws a `Validator.Error`.
///
/// - Parameters:
///   - type: A concrete type of `Constraint` to convert to.
///   - constraint: A `Constraint` to be converted.
/// - Throws: A `Validator.Error`  if the constraint can't be converted to the certain type.
/// - Returns: A converted concrete type of `Constraint`.
@discardableResult
public func assertConstraintType<T: Constraint>(_ type: T.Type, for constraint: Constraint) throws -> T {
    guard let constraint = constraint as? T else {
        let message = Validator.Error.Message.constraintType(type).text
        throw Validator.Error.invalidArgument(message)
    }

    return constraint
}
