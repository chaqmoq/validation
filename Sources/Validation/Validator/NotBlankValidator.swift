struct NotBlankValidator: ConstraintValidator {
    func validate(_ value: Encodable?) throws {
        try validate(value, against: NotBlankConstraint())
    }

    func validate(_ value: Encodable?, against constraint: Constraint) throws {
        let value = try assertPrimitive(value)
        let constraint = try assertConstraintType(NotBlankConstraint.self, for: constraint)
        if value.isEmpty { throw ConstraintViolation(constraint.message) }
    }
}
