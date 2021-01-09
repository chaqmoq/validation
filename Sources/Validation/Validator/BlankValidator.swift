struct BlankValidator: ConstraintValidator {
    func validate(_ value: String, against constraint: Constraint) throws {
        guard let constraint = constraint as? BlankConstraint else {
            let message = "The constraint must be of \(String(describing: BlankConstraint.self)) type."
            throw ValidatorError.invalidArgument(message)
        }

        if !value.isEmpty { throw ConstraintViolation(message: constraint.message) }
    }

    func validate(_ value: String) throws {
        try validate(value, against: BlankConstraint())
    }
}
