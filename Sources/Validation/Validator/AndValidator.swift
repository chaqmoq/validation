struct AndValidator: ConstraintValidator {
    func validate(_ value: String, against constraints: [Constraint]) throws {
        var constraints = constraints
        if constraints.isEmpty { constraints.append(AndConstraint()) }

        guard let constraint = constraints.first(where: { $0 is AndConstraint }) as? AndConstraint else {
            let message = "The constraint must be of \(String(describing: AndConstraint.self)) type."
            throw ValidatorError.invalidArgument(message)
        }

        for childConstraint in constraint.constraints {
            do {
                try childConstraint.validator.validate(value, against: childConstraint)
            } catch {
                throw ConstraintViolation(message: error.localizedDescription)
            }
        }
    }
}
