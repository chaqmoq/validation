struct LengthValidator: ConstraintValidator {
    func validate(_ value: Encodable?) throws {
        try validate(value, against: LengthConstraint())
    }

    func validate(_ value: Encodable?, against constraint: Constraint) throws {
        let value = try assertPrimitive(value)
        let constraint = try assertConstraintType(LengthConstraint.self, for: constraint)

        if constraint.min > constraint.max {
            let message = Validator.Error.Message.lengthRange(constraint.min, constraint.max).text
            throw Validator.Error.invalidArgument(message)
        }

        let length = value.count

        if constraint.min == constraint.max, length != constraint.min {
            throw ConstraintViolation(constraint.exactMessage)
        } else if length < constraint.min {
            throw ConstraintViolation(constraint.minMessage)
        } else if length > constraint.max {
            throw ConstraintViolation(constraint.maxMessage)
        }
    }
}
