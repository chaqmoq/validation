import Foundation

struct HexColorValidator: ConstraintValidator {
    func validate(_ value: Encodable?) throws {
        try validate(value, against: HexColorConstraint())
    }

    func validate(_ value: Encodable?, against constraint: Constraint) throws {
        let value = try assertPrimitive(value)
        let constraint = try assertConstraintType(HexColorConstraint.self, for: constraint)
        let pattern = "^#?([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)

        if !predicate.evaluate(with: value) {
            throw ConstraintViolation(constraint.message)
        }
    }
}
