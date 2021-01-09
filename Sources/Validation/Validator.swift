/// A default `Validator` class to validate a value with multiple types of `Constraint`s.
public final class Validator {
    /// Initializes a new instance.
    public init() {}

    /// Validates a value against an array of `Constraint`s.
    ///
    /// - Parameters:
    ///   - value: A value to be validated.
    ///   - constraints: An array of `Constraint`s.
    ///   - groups: Validation groups to run validation on. Defaults to an empty array.
    /// - Throws: An error type of `ConstraintViolation`.
    public func validate(_ value: String, against constraints: [Constraint], on groups: Set<Group> = .init()) throws {
        for constraint in constraints {
            if ((groups.isEmpty || groups.contains(.default)) && constraint.groups.isEmpty) ||
                !groups.intersection(constraint.groups).isEmpty {
                try constraint.validator.validate(value, against: constraint)
            }
        }
    }

    /// Validates a value against a variadic list of `Constraint`s.
    ///
    /// - Parameters:
    ///   - value: A value to be validated.
    ///   - constraints: A variadic list of `Constraint`s.
    ///   - groups: Validation groups to run validation on. Defaults to an empty array.
    /// - Throws: An error type of `ConstraintViolation`.
    public func validate(
        _ value: String,
        against constraints: Constraint...,
        on groups: Set<Group> = .init()
    ) throws {
        try validate(value, against: constraints, on: groups)
    }

    /// Validates a value against an array of `ConstraintType`s.
    ///
    /// - Parameters:
    ///   - value: A value to be validated.
    ///   - constraintTypes: An array of `ConstraintType`s.
    ///   - groups: Validation groups to run validation on. Defaults to an empty array.
    /// - Throws: An error type of `ConstraintViolation`.
    public func validate(
        _ value: String,
        against constraintTypes: [ConstraintType],
        on groups: Set<Group> = .init()
    ) throws {
        let constraints = constraintTypes.map { $0.constraint }
        try validate(value, against: constraints, on: groups)
    }
}
