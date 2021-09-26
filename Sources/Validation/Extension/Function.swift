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
    }

    return nil
}
