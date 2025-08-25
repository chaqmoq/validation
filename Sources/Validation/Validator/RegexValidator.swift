import Foundation

struct RegexValidator: ConstraintValidator {
    func validate(_ value: Encodable?) throws {
        try validate(value, against: RegexConstraint())
    }

    func validate(_ value: Encodable?, against constraint: Constraint) throws {
        let value = try assertPrimitive(value)
        let constraint = try assertConstraintType(RegexConstraint.self, for: constraint)

        let regex = try NSRegularExpression(pattern: constraint.pattern, options: [])
        let range = NSRange(location: 0, length: value.utf16.count)

        if regex.firstMatch(in: value, options: [], range: range) == nil {
            throw ConstraintViolation(constraint.message)
        }
    }
}
