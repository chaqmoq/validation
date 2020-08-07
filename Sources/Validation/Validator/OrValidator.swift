struct OrValidator: ConstraintValidator {
    func validate(_ value: String, against constraints: [Constraint]) throws {
        var constraints = constraints
        if constraints.isEmpty { constraints.append(OrConstraint()) }

        guard let constraint = constraints.first(where: { $0 is OrConstraint }) as? OrConstraint else {
            let message = "The constraint must be of \(String(describing: OrConstraint.self)) type."
            throw ValidatorError.invalidArgument(message)
        }

        var isValid = constraint.constraints.isEmpty

        for childConstraint in constraint.constraints {
            do {
                try childConstraint.validator.validate(value, against: childConstraint)
                isValid = true
                break
            } catch {
                continue
            }
        }

        if !isValid { throw ConstraintViolation(message: constraint.message) }
    }
}
