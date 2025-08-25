import Foundation

struct IPValidator: ConstraintValidator {
    static let pattern = """
    ^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.\
    ([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.([01]?\\d\\d?|2[0-4]\\d|25[0-5])$
    """
    private static let regex = try! NSRegularExpression(pattern: pattern, options: [])

    func validate(_ value: Encodable?) throws {
        try validate(value, against: IPConstraint())
    }

    func validate(_ value: Encodable?, against constraint: Constraint) throws {
        let value = try assertPrimitive(value)
        let constraint = try assertConstraintType(IPConstraint.self, for: constraint)
        let range = NSRange(location: 0, length: value.utf16.count)

        if Self.regex.firstMatch(in: value, options: [], range: range) == nil {
            throw ConstraintViolation(constraint.message)
        }
    }
}
