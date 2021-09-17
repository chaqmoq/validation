/// A default `Validator` class to validate a value against multiple types of `Constraint`s on `Group`s.
open class Validator {
    /// Initializes a new instance.
    public init() {}

    /// Validates a value against an array of `Constraint`s on `Group`s.
    ///
    /// - Parameters:
    ///   - value: A value to be validated.
    ///   - constraints: An array of `Constraint`s.
    ///   - groups: Validation groups to run validation on a value. Defaults to an empty set.
    /// - Throws: A `ConstraintViolation` error.
    public func validate(
        _ value: Any?,
        against constraints: [Constraint],
        on groups: Set<Group> = .init()
    ) throws {
        for constraint in constraints {
            if ((groups.isEmpty || groups.contains(.default)) && constraint.groups.isEmpty) ||
                !groups.isDisjoint(with: constraint.groups)
            {
                try constraint.validator.validate(value, against: constraint)
            }
        }
    }

    /// Validates a value against a variadic list of `Constraint`s on `Group`s.
    ///
    /// - Parameters:
    ///   - value: A value to be validated.
    ///   - constraints: A variadic list of `Constraint`s.
    ///   - groups: Validation groups to run validation on a value. Defaults to an empty set.
    /// - Throws: A `ConstraintViolation` error.
    public func validate(
        _ value: Any?,
        against constraints: Constraint...,
        on groups: Set<Group> = .init()
    ) throws {
        try validate(value, against: constraints, on: groups)
    }

    /// Validates a value against an array of `ConstraintType`s on `Group`s.
    ///
    /// - Parameters:
    ///   - value: A value to be validated.
    ///   - constraintTypes: An array of `ConstraintType`s.
    ///   - groups: Validation groups to run validation on a value. Defaults to an empty set.
    /// - Throws: A `ConstraintViolation` error.
    public func validate(
        _ value: Any?,
        against constraintTypes: [ConstraintType],
        on groups: Set<Group> = .init()
    ) throws {
        let constraints = constraintTypes.map { $0.constraint }
        try validate(value, against: constraints, on: groups)
    }

    /// Validates a dictionary of keys and values against a dictionary of keys and an array of `Constraint`s as values on `Group`s.
    ///
    /// - Parameters:
    ///   - dictionary: A dictionary of keys and values to be validated.
    ///   - constraints: A dictionary of keys and an array of `Constraint`s as values.
    ///   - groups: Validation groups to run validation on values. Defaults to an empty set.
    /// - Returns: A dictionary of keys and an array of `ConstraintViolation`s as values.
    public func validate(
        _ dictionary: [String: Any],
        against constraints: [String: [Constraint]],
        on groups: Set<Group> = .init()
    ) -> [String: [ConstraintViolation]] {
        var constraintViolations: [String: [ConstraintViolation]] = .init()

        for (key, keyConstraints) in constraints {
            let value = dictionary[key] ?? ""

            for keyConstraint in keyConstraints {
                do {
                    try validate(value, against: [keyConstraint], on: groups)
                } catch {
                    let constraintViolation = error as! ConstraintViolation

                    if constraintViolations[key] == nil {
                        constraintViolations[key] = [constraintViolation]
                    } else {
                        constraintViolations[key]?.append(constraintViolation)
                    }
                }
            }
        }

        return constraintViolations
    }

    /// Validates a dictionary of keys and values against a dictionary of keys and an array of `ConstraintType`s as values on `Group`s.
    ///
    /// - Parameters:
    ///   - dictionary: A dictionary of keys and values to be validated.
    ///   - constraintTypes: A dictionary of keys and an array of `ConstraintType`s as values.
    ///   - groups: Validation groups to run validation on values. Defaults to an empty set.
    /// - Returns: A dictionary of keys and an array of `ConstraintViolation`s as values.
    public func validate(
        _ dictionary: [String: Any],
        against constraintTypes: [String: [ConstraintType]],
        on groups: Set<Group> = .init()
    ) -> [String: [ConstraintViolation]] {
        let constraints = constraintTypes.mapValues { $0.map { $0.constraint }}
        return validate(dictionary, against: constraints, on: groups)
    }
}
