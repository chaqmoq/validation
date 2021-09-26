struct IntegerValidator: ConstraintValidator {
    func validate(_ value: Encodable?) throws {
        try validate(value, against: IntegerConstraint())
    }

    func validate(_ value: Encodable?, against constraint: Constraint) throws {
        let value = try assertPrimitive(value)
        guard let intValue = Int(value) else {
            let message = Validator.Error.Message.integerType.text
            throw Validator.Error.invalidArgument(message)
        }
        let constraint = try assertConstraintType(IntegerConstraint.self, for: constraint)

        if constraint.min > constraint.max {
            let message = Validator.Error.Message.integerRange(constraint.min, constraint.max).text
            throw Validator.Error.invalidArgument(message)
        }

        if constraint.min == constraint.max, intValue != constraint.min {
            throw ConstraintViolation(constraint.exactMessage)
        } else if intValue < constraint.min {
            throw ConstraintViolation(constraint.minMessage)
        } else if intValue > constraint.max {
            throw ConstraintViolation(constraint.maxMessage)
        }
    }
}
