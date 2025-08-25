import Foundation

struct EmailValidator: ConstraintValidator {
    static let pattern = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
    private static let regex = try! NSRegularExpression(pattern: pattern, options: [])

    func validate(_ value: Encodable?) throws {
        try validate(value, against: EmailConstraint())
    }

    func validate(_ value: Encodable?, against constraint: Constraint) throws {
        let value = try assertPrimitive(value)
        let constraint = try assertConstraintType(EmailConstraint.self, for: constraint)
        let range = NSRange(location: 0, length: value.utf16.count)

        if Self.regex.firstMatch(in: value, options: [], range: range) == nil {
            throw ConstraintViolation(constraint.message)
        }
    }
}
