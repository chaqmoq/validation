import Foundation

struct BoolValidator: ConstraintValidator {
    func validate(_ value: Encodable?) throws {
        try validate(value, against: BoolConstraint())
    }

    func validate(_ value: Encodable?, against constraint: Constraint) throws {
        let value = try assertPrimitive(value)
        let constraint = try assertConstraintType(BoolConstraint.self, for: constraint)

        if Bool(value) == nil {
            throw ConstraintViolation(constraint.message)
        }
    }
}
