struct IntegerValidator: ConstraintValidator {
    func validate(_ value: String, against constraint: Constraint) throws {
        guard let constraint = constraint as? IntegerConstraint else {
            let message = "The constraint must be of \(String(describing: IntegerConstraint.self)) type."
            throw ValidatorError.invalidArgument(message)
        }

        if constraint.min > constraint.max {
            let message = """
            The minimum value of \(constraint.min) must be less than or equal to maximum value of \(constraint.max).
            """
            throw ConstraintViolation(message: message)
        }

        guard let intValue = Int(value) else { throw ConstraintViolation(message: "The value must be an integer.") }

        if constraint.min == constraint.max && intValue != constraint.min {
            throw ConstraintViolation(message: constraint.exactMessage)
        }

        if intValue < constraint.min {
            throw ConstraintViolation(message: constraint.minMessage)
        } else if intValue > constraint.max {
            throw ConstraintViolation(message: constraint.maxMessage)
        }
    }

    func validate(_ value: String) throws {
        try validate(value, against: IntegerConstraint())
    }
}
