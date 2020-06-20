struct LengthValidator: ConstraintValidator {
    func validate(_ value: String, against constraints: Constraint...) throws {
        try validate(value, against: constraints)
    }

    func validate(_ value: String, against constraints: [Constraint]) throws {
        guard let constraint = constraints.first(where: { $0 is LengthConstraint }) as? LengthConstraint else {
            throw ValidatorError.invalidArgument(
                "The constraint must be of \(String(describing: LengthConstraint.self)) type."
            )
        }

        if constraint.min > constraint.max {
            throw ValidatorError.invalidArgument(
                "The minimum value of \(constraint.min) must be less than or equal to maximum value of \(constraint.max)."
            )
        }

        let length = value.count

        if constraint.min == constraint.max && length != constraint.min {
            throw ConstraintViolation(message: constraint.exactMessage)
        }

        if length < constraint.min {
            throw ConstraintViolation(message: constraint.minMessage)
        } else if length > constraint.max {
            throw ConstraintViolation(message: constraint.maxMessage)
        }
    }
}
