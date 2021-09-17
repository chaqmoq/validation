struct OrValidator: ConstraintValidator {
    func validate(_ value: Any?) throws {
        try validate(value, against: OrConstraint())
    }

    func validate(_ value: Any?, against constraint: Constraint) throws {
        guard let constraint = constraint as? OrConstraint else {
            let message = "The constraint must be of \(String(describing: OrConstraint.self)) type."
            throw Validator.Error.invalidArgument(message)
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
}
