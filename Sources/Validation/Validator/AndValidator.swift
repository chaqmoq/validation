struct AndValidator: ConstraintValidator {
    func validate(_ value: String) throws {
        try validate(value, against: AndConstraint())
    }

    func validate(_ value: String, against constraint: Constraint) throws {
        guard let constraint = constraint as? AndConstraint else {
            let message = "The constraint must be of \(String(describing: AndConstraint.self)) type."
            throw Validator.Error.invalidArgument(message)
        }

        for childConstraint in constraint.constraints {
            do {
                try childConstraint.validator.validate(value, against: childConstraint)
            } catch {
                throw ConstraintViolation(error.localizedDescription)
            }
        }
    }
}
