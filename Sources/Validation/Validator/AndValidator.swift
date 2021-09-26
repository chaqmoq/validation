struct AndValidator: ConstraintValidator {
    func validate(_ value: Encodable?) throws {
        try validate(value, against: AndConstraint())
    }

    func validate(_ value: Encodable?, against constraint: Constraint) throws {
        let constraint = try assertConstraintType(AndConstraint.self, for: constraint)

        for childConstraint in constraint.constraints {
            do {
                try childConstraint.validator.validate(value, against: childConstraint)
            } catch {
                throw ConstraintViolation(error.localizedDescription)
            }
        }
    }
}
