import Foundation

struct ChoiceValidator: ConstraintValidator {
    func validate(_ value: Encodable?) throws {
        try validate(value, against: ChoiceConstraint())
    }

    func validate(_ value: Encodable?, against constraint: Constraint) throws {
        let value = try assertPrimitive(value)
        let constraint = try assertConstraintType(ChoiceConstraint.self, for: constraint)

        if !constraint.choices.contains(where: { primitive($0) == primitive(value) }) {
            throw ConstraintViolation(constraint.message)
        }
    }
}
