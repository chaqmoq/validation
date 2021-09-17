struct NotBlankValidator: ConstraintValidator {
    func validate(_ value: Any?) throws {
        try validate(value, against: NotBlankConstraint())
    }

    func validate(_ value: Any?, against constraint: Constraint) throws {
        guard let constraint = constraint as? NotBlankConstraint else {
            let message = "The constraint must be of \(String(describing: NotBlankConstraint.self)) type."
            throw Validator.Error.invalidArgument(message)
        }

        let value = "\(value ?? "")"
        if value.isEmpty { throw ConstraintViolation(constraint.message) }
    }
}
