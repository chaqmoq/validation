struct OrValidator: ConstraintValidator {
    func validate(_ value: String, against constraint: Constraint) throws {
        guard let constraint = constraint as? OrConstraint else {
            let message = "The constraint must be of \(String(describing: OrConstraint.self)) type."
            throw ValidatorError.invalidArgument(message)
        }

        var isValid = constraint.constraints.isEmpty
        var firstError: Error?

        for childConstraint in constraint.constraints {
            do {
                try childConstraint.validator.validate(value, against: childConstraint)
                isValid = true
                break
            } catch {
                if firstError == nil { firstError = error }
                continue
            }
        }

        if let error = firstError, !isValid { throw error }
    }

    func validate(_ value: String) throws {
        try validate(value, against: OrConstraint())
    }
}
