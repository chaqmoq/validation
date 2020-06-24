struct BlankValidator: ConstraintValidator {
    func validate(_ value: String, against constraints: [Constraint]) throws {
        var constraints = constraints

        if constraints.isEmpty {
            constraints.append(BlankConstraint())
        }

        guard let constraint = constraints.first(where: { $0 is BlankConstraint }) as? BlankConstraint else {
            throw ValidatorError.invalidArgument(
                "The constraint must be of \(String(describing: BlankConstraint.self)) type."
            )
        }

        if !value.isEmpty {
            throw ConstraintViolation(message: constraint.message)
        }
    }
}
