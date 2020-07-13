struct IntegerValidator: ConstraintValidator {
    func validate(_ value: String, against constraints: [Constraint]) throws {
        var constraints = constraints
        if constraints.isEmpty { constraints.append(IntegerConstraint()) }

        guard let constraint = constraints.first(where: { $0 is IntegerConstraint }) as? IntegerConstraint else {
            let message = "The constraint must be of \(String(describing: IntegerConstraint.self)) type."
            throw ValidatorError.invalidArgument(message)
        }

        if constraint.min > constraint.max {
            let message = """
            The minimum value of \(constraint.min) must be less than or equal to maximum value of \(constraint.max).
            """
            throw ValidatorError.invalidArgument(message)
        }

        guard let intValue = Int(value) else { throw ValidatorError.invalidArgument("The value must be an integer.") }

        if constraint.min == constraint.max && intValue != constraint.min {
            throw ConstraintViolation(message: constraint.exactMessage)
        }

        if intValue < constraint.min {
            throw ConstraintViolation(message: constraint.minMessage)
        } else if intValue > constraint.max {
            throw ConstraintViolation(message: constraint.maxMessage)
        }
    }
}
