import Foundation

struct UUIDValidator: ConstraintValidator {
    func validate(_ value: Encodable?) throws {
        try validate(value, against: UUIDConstraint())
    }

    func validate(_ value: Encodable?, against constraint: Constraint) throws {
        let value = try assertPrimitive(value)
        let constraint = try assertConstraintType(UUIDConstraint.self, for: constraint)

        if UUID(uuidString: value) == nil {
            throw ConstraintViolation(constraint.message)
        }
    }
}
