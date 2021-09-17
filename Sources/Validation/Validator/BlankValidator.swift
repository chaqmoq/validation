struct BlankValidator: ConstraintValidator {
    func validate(_ value: Any?) throws {
        try validate(value, against: BlankConstraint())
    }

    func validate(_ value: Any?, against constraint: Constraint) throws {
        guard let constraint = constraint as? BlankConstraint else {
            let message = "The constraint must be of \(String(describing: BlankConstraint.self)) type."
            throw Validator.Error.invalidArgument(message)
        }

        let value = "\(value ?? "")"
        if !value.isEmpty { throw ConstraintViolation(constraint.message) }
    }
}
