public struct Validator: ConstraintValidator {
    public init() {}

    public func validate(_ value: String, against constraints: [Constraint]) throws {
        for constraint in constraints {
            try constraint.validator.validate(value, against: constraint)
        }
    }
}
