/// Validates values against `Constraint`s on `Group`s or `GroupSequence` with `Validator.Options`.
open class Validator {
    /// Initializes a new instance.
    public init() {}

    /// Validates a single primitive `Encodable` value against an array of `Constraint`s on a set of `Group`s.
    ///
    /// - Parameters:
    ///   - value: A single primitive `Encodable` value to be validated.
    ///   - constraints: An array of `Constraint`s.
    ///   - groups: A set of `Group`s to run validations. Defaults to an empty set.
    /// - Throws: A `ConstraintViolation` error.
    public func validate(
        _ value: Encodable?,
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

    /// Validates a single primitive `Encodable` value against a variadic list of `Constraint`s on a set of `Group`s.
    ///
    /// - Parameters:
    ///   - value: A single primitive `Encodable` value to be validated.
    ///   - constraints: A variadic list of `Constraint`s.
    ///   - groups: A set of `Group`s to run validations. Defaults to an empty set.
    /// - Throws: A `ConstraintViolation` error.
    public func validate(
        _ value: Encodable?,
        against constraints: Constraint...,
        on groups: Set<Group> = .init()
    ) throws {
        try validate(value, against: constraints, on: groups)
    }

    /// Validates a single primitive `Encodable` value against an array of `ConstraintType`s on a set of `Group`s.
    ///
    /// - Parameters:
    ///   - value: A single primitive `Encodable` value to be validated.
    ///   - constraintTypes: An array of `ConstraintType`s.
    ///   - groups: A set of `Group`s to run validations. Defaults to an empty set.
    /// - Throws: A `ConstraintViolation` error.
    public func validate(
        _ value: Encodable?,
        against constraintTypes: [ConstraintType],
        on groups: Set<Group> = .init()
    ) throws {
        let constraints = constraintTypes.map { $0.constraint }
        try validate(value, against: constraints, on: groups)
    }

    /// Validates a complex `Encodable` value against a `DictionaryCollection<String, Constraint>` on a set of `Group`s with a list of
    /// `Validator.Options`.
    ///
    /// - Parameters:
    ///   - value: A complex `Encodable` value to be validated.
    ///   - constraintCollection: A `DictionaryCollection<String, Constraint>`.
    ///   - groups: A set of `Group`s to run validations. Defaults to an empty set.
    ///   - options: A list of `Validator.Options`. Defaults to an empty array.
    /// - Throws: A `Validator.Error` if it can't decode the encoded value.
    /// - Returns: A `DictionaryCollection<String, ConstraintViolation>`.
    public func validate(
        _ value: Encodable?,
        against constraintCollection: DictionaryCollection<String, Constraint>,
        on groups: Set<Group> = .init(),
        with options: Options = .init()
    ) throws -> DictionaryCollection<String, ConstraintViolation> {
        guard let dictionary = try value?.asDictionary() else { return .init() }
        var constraintViolationCollection = DictionaryCollection<String, ConstraintViolation>()

        for (key, constraints) in constraintCollection {
            if options.contains(.strict) || dictionary.contains(where: { $0.key == key }) {
                let value = primitive(dictionary[key] ?? nil)

                for constraint in constraints {
                    do {
                        try validate(value, against: [constraint], on: groups)
                    } catch {
                        let constraintViolation = error as! ConstraintViolation
                        constraintViolationCollection[key].append(constraintViolation)
                    }
                }
            }
        }

        return constraintViolationCollection
    }

    /// Validates a complex `Encodable` value against a `DictionaryCollection<String, Constraint>` on a `GroupSequence` with a list of
    /// `Validator.Options`.
    ///
    /// - Parameters:
    ///   - value: A complex `Encodable` value to be validated.
    ///   - constraintCollection: A `DictionaryCollection<String, Constraint>`.
    ///   - groupSequence: A list of groups.
    ///   - options: A list of `Validator.Options`. Defaults to an empty array.
    /// - Throws: A `Validator.Error` if it can't decode the encoded value.
    /// - Returns: A `DictionaryCollection<String, ConstraintViolation>`.
    public func validate(
        _ value: Encodable?,
        against constraintCollection: DictionaryCollection<String, Constraint>,
        on groupSequence: GroupSequence,
        with options: Options = .init()
    ) throws -> DictionaryCollection<String, ConstraintViolation> {
        guard let dictionary = try value?.asDictionary() else { return .init() }
        var constraintViolationCollection = DictionaryCollection<String, ConstraintViolation>()

        for group in groupSequence.groups {
            for (key, constraints) in constraintCollection {
                if options.contains(.strict) || dictionary.contains(where: { $0.key == key }) {
                    let value = primitive(dictionary[key] ?? nil)

                    for constraint in constraints {
                        do {
                            try validate(value, against: [constraint], on: [group])
                        } catch {
                            let constraintViolation = error as! ConstraintViolation
                            constraintViolationCollection[key].append(constraintViolation)
                        }
                    }
                }
            }

            if !constraintViolationCollection.isEmpty { break }
        }

        return constraintViolationCollection
    }
}
