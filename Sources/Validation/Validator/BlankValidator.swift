struct BlankValidator: ConstraintValidator {
    func validate(_ value: Encodable?) throws {
        try validate(value, against: BlankConstraint())
    }

    func validate(_ value: Encodable?, against constraint: Constraint) throws {
        let value = try assertPrimitive(value)
        let constraint = try assertConstraintType(BlankConstraint.self, for: constraint)

        if !value.isEmpty {
            throw ConstraintViolation(constraint.message)
        }
    }
}
