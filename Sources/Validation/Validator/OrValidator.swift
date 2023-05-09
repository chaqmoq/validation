struct OrValidator: ConstraintValidator {
    func validate(_ value: Encodable?) throws {
        try validate(value, against: OrConstraint())
    }

    func validate(_ value: Encodable?, against constraint: Constraint) throws {
        let constraint = try assertConstraintType(OrConstraint.self, for: constraint)
        var isValid = constraint.constraints.isEmpty
        var firstError: Error?

        for childConstraint in constraint.constraints {
            do {
                try childConstraint.validator.validate(value, against: childConstraint)
                isValid = true
                break
            } catch {
                if firstError == nil {
                    firstError = error
                }
            }
        }

        if let error = firstError, !isValid {
            throw error
        }
    }
}
