public struct Validator: ConstraintValidator {
    public init() {}

    public func validate(_ value: String, against constraints: Constraint...) throws {
        try validate(value, against: constraints)
    }

    public func validate(_ value: String, against constraints: [Constraint]) throws {
        for constraint in constraints {
            try constraint.validator.validate(value, against: constraint)
        }
    }

    public func validate(_ value: String, against constraintTypes: ConstraintType...) throws {
        try validate(value, against: constraintTypes)
    }

    public func validate(_ value: String, against constraintTypes: [ConstraintType]) throws {
        for constraintType in constraintTypes {
            let constraint = constraintType.constraint
            try constraint.validator.validate(value, against: constraint)
        }
    }
}
