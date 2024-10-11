import Foundation

struct EmailValidator: ConstraintValidator {
    static let pattern = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"

    func validate(_ value: Encodable?) throws {
        try validate(value, against: EmailConstraint())
    }

    func validate(_ value: Encodable?, against constraint: Constraint) throws {
        let value = try assertPrimitive(value)
        let constraint = try assertConstraintType(EmailConstraint.self, for: constraint)
        let predicate = NSPredicate(format: "SELF MATCHES %@", Self.pattern)

        if !predicate.evaluate(with: value) {
            throw ConstraintViolation(constraint.message)
        }
    }
}
