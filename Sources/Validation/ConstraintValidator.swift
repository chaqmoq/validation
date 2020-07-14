/// A common protocol for all validators.
public protocol ConstraintValidator {
    /// Validates a value against an array of `Constraint`s.
    ///
    /// - Parameters:
    ///   - value: A value to be validated.
    ///   - constraints: An array of `Constraint`s.
    /// - Throws: An error type of `ConstraintViolation`.
    func validate(_ value: String, against constraints: [Constraint]) throws

    /// Validates a value against a variadic list of `Constraint`s.
    ///
    /// - Parameters:
    ///   - value: A value to be validated.
    ///   - constraints: A variadic list of `Constraint`s.
    /// - Throws: An error type of `ConstraintViolation`.
    func validate(_ value: String, against constraints: Constraint...) throws

    /// Validates a value against an array of `ConstraintType`s.
    /// 
    /// - Parameters:
    ///   - value: A value to be validated.
    ///   - constraintTypes: An array of `ConstraintType`s.
    /// - Throws: An error type of `ConstraintViolation`.
    func validate(_ value: String, against constraintTypes: [ConstraintType]) throws
}

extension ConstraintValidator {
    /// Validates a value against an array of `Constraint`s.
    ///
    /// - Parameters:
    ///   - value: A value to be validated.
    ///   - constraints: An array of `Constraint`s.
    /// - Throws: An error type of `ConstraintViolation`.
    public func validate(_ value: String, against constraints: [Constraint]) throws {
        for constraint in constraints { try constraint.validator.validate(value, against: constraint) }
    }

    /// Validates a value against a variadic list of `Constraint`s.
    ///
    /// - Parameters:
    ///   - value: A value to be validated.
    ///   - constraints: A variadic list of `Constraint`s.
    /// - Throws: An error type of `ConstraintViolation`.
    public func validate(_ value: String, against constraints: Constraint...) throws {
        try validate(value, against: constraints)
    }

    /// Validates a value against an array of `ConstraintType`s.
    ///
    /// - Parameters:
    ///   - value: A value to be validated.
    ///   - constraintTypes: An array of `ConstraintType`s.
    /// - Throws: An error type of `ConstraintViolation`.
    public func validate(_ value: String, against constraintTypes: [ConstraintType]) throws {
        let constraints = constraintTypes.map { $0.constraint }
        try validate(value, against: constraints)
    }
}
