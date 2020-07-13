struct BlankValidator: ConstraintValidator {
    func validate(_ value: String, against constraints: [Constraint]) throws {
        var constraints = constraints
        if constraints.isEmpty { constraints.append(BlankConstraint()) }

        guard let constraint = constraints.first(where: { $0 is BlankConstraint }) as? BlankConstraint else {
            let message = "The constraint must be of \(String(describing: BlankConstraint.self)) type."
            throw ValidatorError.invalidArgument(message)
        }

        if !value.isEmpty { throw ConstraintViolation(message: constraint.message) }
    }
}
