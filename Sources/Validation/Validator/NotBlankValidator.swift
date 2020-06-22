struct NotBlankValidator: ConstraintValidator {
    func validate(_ value: String, against constraints: [Constraint]) throws {
        var constraints = constraints

        if constraints.isEmpty {
            constraints.append(NotBlankConstraint())
        }

        guard let constraint = constraints.first(where: { $0 is NotBlankConstraint }) as? NotBlankConstraint else {
            throw ValidatorError.invalidArgument(
                "The constraint must be of \(String(describing: NotBlankConstraint.self)) type."
            )
        }

        if value.isEmpty {
            throw ConstraintViolation(message: constraint.message)
        }
    }
}
