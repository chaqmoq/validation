public protocol ConstraintValidator {
    func validate(_ value: String, against constraints: Constraint...) throws
    func validate(_ value: String, against constraints: [Constraint]) throws
    func validate(_ value: String, against constraintTypes: [ConstraintType]) throws
}

extension ConstraintValidator {
    public func validate(_ value: String, against constraints: Constraint...) throws {
        try validate(value, against: constraints)
    }

    public func validate(_ value: String, against constraintTypes: [ConstraintType]) throws {
        let constraints = constraintTypes.map { $0.constraint }
        try validate(value, against: constraints)
    }
}
