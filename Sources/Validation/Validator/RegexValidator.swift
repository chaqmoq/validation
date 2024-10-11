import Foundation

struct RegexValidator: ConstraintValidator {
    func validate(_ value: Encodable?) throws {
        try validate(value, against: RegexConstraint())
    }

    func validate(_ value: Encodable?, against constraint: Constraint) throws {
        let value = try assertPrimitive(value)
        let constraint = try assertConstraintType(RegexConstraint.self, for: constraint)
        let predicate = NSPredicate(format: "SELF MATCHES %@", constraint.pattern)

        if !predicate.evaluate(with: value) {
            throw ConstraintViolation(constraint.message)
        }
    }
}
