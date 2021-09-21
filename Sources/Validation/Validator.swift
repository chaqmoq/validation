/// Validates values against an array of `Constraint`s on a set of `Group`s or `GroupSequence` with `Validator.Options`.
open class Validator {
    /// Initializes a new instance.
    public init() {}

    /// Validates a value against an array of `Constraint`s on a set of `Group`s.
    ///
    /// - Parameters:
    ///   - value: A value to be validated.
    ///   - constraints: An array of `Constraint`s.
    ///   - groups: A set of `Group`s to run validations. Defaults to an empty set.
    /// - Throws: A `ConstraintViolation` error.
    public func validate(
        _ value: Any?,
        against constraints: [Constraint],
        on groups: Set<Group> = .init()
    ) throws {
        for constraint in constraints {
            if ((groups.isEmpty || groups.contains(.default)) && constraint.groups.isEmpty) ||
                !groups.isDisjoint(with: constraint.groups) {
                try constraint.validator.validate(value, against: constraint)
            }
        }
    }

    /// Validates a value against a variadic list of `Constraint`s on a set of `Group`s.
    ///
    /// - Parameters:
    ///   - value: A value to be validated.
    ///   - constraints: A variadic list of `Constraint`s.
    ///   - groups: A set of `Group`s to run validations. Defaults to an empty set.
    /// - Throws: A `ConstraintViolation` error.
    public func validate(
        _ value: Any?,
        against constraints: Constraint...,
        on groups: Set<Group> = .init()
    ) throws {
        try validate(value, against: constraints, on: groups)
    }

    /// Validates a value against an array of `ConstraintType`s on a set of `Group`s.
    ///
    /// - Parameters:
    ///   - value: A value to be validated.
    ///   - constraintTypes: An array of `ConstraintType`s.
    ///   - groups: A set of `Group`s to run validations. Defaults to an empty set.
    /// - Throws: A `ConstraintViolation` error.
    public func validate(
        _ value: Any?,
        against constraintTypes: [ConstraintType],
        on groups: Set<Group> = .init()
    ) throws {
        let constraints = constraintTypes.map { $0.constraint }
        try validate(value, against: constraints, on: groups)
    }

    /// Validates a dictionary of keys and values against a dictionary of keys and an array of `Constraint`s as values on a set of `Group`s.
    ///
    /// - Parameters:
    ///   - dictionary: A dictionary of keys and values to be validated.
    ///   - constraints: A dictionary of keys and an array of `Constraint`s as values.
    ///   - groups: A set of `Group`s to run validations. Defaults to an empty set.
    ///   - options: A list of `Validator.Options`. Defaults to an empty array.
    /// - Returns: A dictionary of keys and an array of `ConstraintViolation`s as values.
    public func validate(
        _ dictionary: [String: Any?],
        against constraints: [String: [Constraint]],
        on groups: Set<Group> = .init(),
        with options: Options = .init()
    ) -> [String: [ConstraintViolation]] {
        var constraintViolations: [String: [ConstraintViolation]] = .init()

        for (key, keyConstraints) in constraints {
            if options.contains(.strict) || dictionary.contains(where: { $0.key == key }) {
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
        }

        return constraintViolations
    }

    /// Validates a dictionary of keys and values against a dictionary of keys and an array of `ConstraintType`s as values on a set of `Group`s.
    ///
    /// - Parameters:
    ///   - dictionary: A dictionary of keys and values to be validated.
    ///   - constraintTypes: A dictionary of keys and an array of `ConstraintType`s as values.
    ///   - groups: A set of `Group`s to run validations. Defaults to an empty set.
    ///   - options: A list of `Validator.Options`. Defaults to an empty array.
    /// - Returns: A dictionary of keys and an array of `ConstraintViolation`s as values.
    public func validate(
        _ dictionary: [String: Any?],
        against constraintTypes: [String: [ConstraintType]],
        on groups: Set<Group> = .init(),
        with options: Options = .init()
    ) -> [String: [ConstraintViolation]] {
        let constraints = constraintTypes.mapValues { $0.map { $0.constraint }}
        return validate(dictionary, against: constraints, on: groups, with: options)
    }

    /// Validates a dictionary of keys and values against a dictionary of keys and an array of `Constraint`s as values on `GroupSequence`.
    ///
    /// - Parameters:
    ///   - dictionary: A dictionary of keys and values to be validated.
    ///   - constraints: A dictionary of keys and an array of `Constraint`s as values.
    ///   - groupSequence: A list of groups.
    ///   - options: A list of `Validator.Options`. Defaults to an empty array.
    /// - Returns: A dictionary of keys and an array of `ConstraintViolation`s as values.
    public func validate(
        _ dictionary: [String: Any?],
        against constraints: [String: [Constraint]],
        on groupSequence: GroupSequence,
        with options: Options = .init()
    ) -> [String: [ConstraintViolation]] {
        var constraintViolations: [String: [ConstraintViolation]] = .init()

        for group in groupSequence.groups {
            for (key, keyConstraints) in constraints {
                if options.contains(.strict) || dictionary.contains(where: { $0.key == key }) {
                    let value = dictionary[key] ?? ""

                    for keyConstraint in keyConstraints {
                        do {
                            try validate(value, against: [keyConstraint], on: [group])
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
            }

            if !constraintViolations.isEmpty { break }
        }

        return constraintViolations
    }

    /// Validates a dictionary of keys and values against a dictionary of keys and an array of `ConstraintType`s as values on `GroupSequence`.
    ///
    /// - Parameters:
    ///   - dictionary: A dictionary of keys and values to be validated.
    ///   - constraintTypes: A dictionary of keys and an array of `ConstraintType`s as values.
    ///   - groupSequence: A list of groups.
    ///   - options: A list of `Validator.Options`. Defaults to an empty array.
    /// - Returns: A dictionary of keys and an array of `ConstraintViolation`s as values.
    public func validate(
        _ dictionary: [String: Any?],
        against constraintTypes: [String: [ConstraintType]],
        on groupSequence: GroupSequence,
        with options: Options = .init()
    ) -> [String: [ConstraintViolation]] {
        let constraints = constraintTypes.mapValues { $0.map { $0.constraint }}
        return validate(dictionary, against: constraints, on: groupSequence, with: options)
    }

    /// Validates an `Encodable` value against a dictionary of keys and an array of `Constraint`s as values on a set of `Group`s.
    ///
    /// - Parameters:
    ///   - encodable: An `Encodable` value to be validated.
    ///   - constraints: A dictionary of keys and an array of `Constraint`s as values.
    ///   - groups: A set of `Group`s to run validations. Defaults to an empty set.
    ///   - options: A list of `Validator.Options`. Defaults to an empty array.
    /// - Throws: An error if it can't decode the encoded value.
    /// - Returns: A dictionary of keys and an array of `ConstraintViolation`s as values.
    public func validate(
        _ encodable: Encodable,
        against constraints: [String: [Constraint]],
        on groups: Set<Group> = .init(),
        with options: Options = .init()
    ) throws -> [String: [ConstraintViolation]] {
        guard let dictionary = try encodable.asDictionary() else { return .init() }
        return validate(dictionary, against: constraints, on: groups, with: options)
    }

    /// Validates an `Encodable` value against a dictionary of keys and an array of `ConstraintType`s as values on a set of `Group`s.
    ///
    /// - Parameters:
    ///   - encodable: An `Encodable` value to be validated.
    ///   - constraintTypes: A dictionary of keys and an array of `ConstraintType`s as values.
    ///   - groups: A set of `Group`s to run validations. Defaults to an empty set.
    ///   - options: A list of `Validator.Options`. Defaults to an empty array.
    /// - Throws: An error if it can't decode the encoded value.
    /// - Returns: A dictionary of keys and an array of `ConstraintViolation`s as values.
    public func validate(
        _ encodable: Encodable,
        against constraintTypes: [String: [ConstraintType]],
        on groups: Set<Group> = .init(),
        with options: Options = .init()
    ) throws -> [String: [ConstraintViolation]] {
        let constraints = constraintTypes.mapValues { $0.map { $0.constraint }}
        return try validate(encodable, against: constraints, on: groups, with: options)
    }

    /// Validates a dictionary of keys and values against a dictionary of keys and an array of `Constraint`s as values on `GroupSequence`.
    ///
    /// - Parameters:
    ///   - encodable: An `Encodable` value to be validated.
    ///   - constraints: A dictionary of keys and an array of `Constraint`s as values.
    ///   - groupSequence: A list of groups.
    ///   - options: A list of `Validator.Options`. Defaults to an empty array.
    /// - Throws: An error if it can't decode the encoded value.
    /// - Returns: A dictionary of keys and an array of `ConstraintViolation`s as values.
    public func validate(
        _ encodable: Encodable,
        against constraints: [String: [Constraint]],
        on groupSequence: GroupSequence,
        with options: Options = .init()
    ) throws -> [String: [ConstraintViolation]] {
        guard let dictionary = try encodable.asDictionary() else { return .init() }
        return validate(dictionary, against: constraints, on: groupSequence, with: options)
    }

    /// Validates a dictionary of keys and values against a dictionary of keys and an array of `ConstraintType`s as values on `GroupSequence`.
    ///
    /// - Parameters:
    ///   - encodable: An `Encodable` value to be validated.
    ///   - constraintTypes: A dictionary of keys and an array of `ConstraintType`s as values.
    ///   - groupSequence: A list of groups.
    ///   - options: A list of `Validator.Options`. Defaults to an empty array.
    /// - Throws: An error if it can't decode the encoded value.
    /// - Returns: A dictionary of keys and an array of `ConstraintViolation`s as values.
    public func validate(
        _ encodable: Encodable,
        against constraintTypes: [String: [ConstraintType]],
        on groupSequence: GroupSequence,
        with options: Options = .init()
    ) throws -> [String: [ConstraintViolation]] {
        let constraints = constraintTypes.mapValues { $0.map { $0.constraint }}
        return try validate(encodable, against: constraints, on: groupSequence, with: options)
    }
}
