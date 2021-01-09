struct LengthValidator: ConstraintValidator {
    func validate(_ value: String, against constraint: Constraint) throws {
        guard let constraint = constraint as? LengthConstraint else {
            let message = "The constraint must be of \(String(describing: LengthConstraint.self)) type."
            throw ValidatorError.invalidArgument(message)
        }

        if constraint.min > constraint.max {
            let message = """
            The minimum value of \(constraint.min) must be less than or equal to maximum value of \(constraint.max).
            """
            throw ValidatorError.invalidArgument(message)
        }

        let length = value.count

        if constraint.min == constraint.max && length != constraint.min {
            throw ConstraintViolation(constraint.exactMessage)
        }

        if length < constraint.min {
            throw ConstraintViolation(constraint.minMessage)
        } else if length > constraint.max {
            throw ConstraintViolation(constraint.maxMessage)
        }
    }

    func validate(_ value: String) throws {
        try validate(value, against: LengthConstraint())
    }
}
