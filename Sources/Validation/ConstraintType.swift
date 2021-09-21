/// A simplified API for the existing `Constraint`s.
public enum ConstraintType {
    /// Creates a `AndConstraint` type with an array of child constraints and a set of validation groups to group by.
    ///
    /// - Parameters:
    ///   - constraints: An array of child constraints.
    ///   - groups: A set of validation groups to group by. Defaults to an empty set.
    case and(_ constraints: [Constraint], groups: Set<Group> = .init())

    /// Creates a `BlankConstraint` type with a custom error message and a set of validation groups to group by.
    ///
    /// - Parameters:
    ///   - message: A custom error message. Defaults to the default error message.
    ///   - groups: A set of validation groups to group by. Defaults to an empty set.
    case blank(_ message: String = BlankConstraint.message, groups: Set<Group> = .init())

    /// Creates an `EmailConstraint`type with a custom error message and a set of validation groups to group by.
    ///
    /// - Parameters:
    ///   - message: A custom error message. Defaults to the default error message.
    ///   - groups: A set of validation groups to group by. Defaults to an empty set.
    case email(_ message: String = EmailConstraint.message, groups: Set<Group> = .init())

    /// Creates an `IntegerConstraint`type with minimum/maximum values, custom minimum/maximum error messages,
    /// and a set of validation groups to group by.
    ///
    /// - Parameters:
    ///   - min: A custom minimum value. Defaults to the default minimum value.
    ///   - max: A custom maximum value. Defaults to the default maximum value.
    ///   - minMessage: A custom error message to show for a minimum value violation. Defaults to the default minimum value violation error message.
    ///   - maxMessage: A custom error message to show for a maximum value violation. Defaults to the default maximum value violation error message.
    ///   - exactMessage: A custom error message to show for an exact value violation. Defaults to the default exact value violation error message.
    ///   - groups: A set of validation groups to group by. Defaults to an empty set.
    case integer(
        min: Int = IntegerConstraint.min,
        max: Int = IntegerConstraint.max,
        minMessage: String = IntegerConstraint.minMessage,
        maxMessage: String = IntegerConstraint.maxMessage,
        exactMessage: String = IntegerConstraint.exactMessage,
        groups: Set<Group> = .init()
    )

    /// Creates an `IPConstraint`type with a custom error message and a set of validation groups to group by.
    ///
    /// - Parameters:
    ///   - message: A custom error message. Defaults to the default error message.
    ///   - groups: A set of validation groups to group by. Defaults to an empty set.
    case ip(_ message: String = IPConstraint.message, groups: Set<Group> = .init())

    /// Creates a `JSONConstraint` type with a custom error message and a set of validation groups to group by.
    ///
    /// - Parameters:
    ///   - message: A custom error message. Defaults to the default error message.
    ///   - groups: A set of validation groups to group by. Defaults to an empty set.
    case json(_ message: String = JSONConstraint.message, groups: Set<Group> = .init())

    /// Creates a `LengthConstraint` type with minimum/maximum values, custom minimum/maximum error messages,
    /// and a set of validation groups to group by.
    ///
    /// - Parameters:
    ///   - min: A custom minimum value. Defaults to the default minimum value.
    ///   - max: A custom maximum value. Defaults to the default maximum value.
    ///   - minMessage: A custom error message to show for a minimum value violation. Defaults to the default minimum value violation error message.
    ///   - maxMessage: A custom error message to show for a maximum value violation. Defaults to the default maximum value violation error message.
    ///   - exactMessage: A custom error message to show for an exact value violation. Defaults to the default exact value violation error message.
    ///   - groups: A set of validation groups to group by. Defaults to an empty set.
    case length(
        min: UInt = LengthConstraint.min,
        max: UInt = LengthConstraint.max,
        minMessage: String = LengthConstraint.minMessage,
        maxMessage: String = LengthConstraint.maxMessage,
        exactMessage: String = LengthConstraint.exactMessage,
        groups: Set<Group> = .init()
    )

    /// Creates a `NotBlankConstraint` type with a custom error message and a set of validation groups to group by.
    ///
    /// - Parameters:
    ///   - message: A custom error message. Defaults to the default error message.
    ///   - groups: A set of validation groups to group by. Defaults to an empty set.
    case notBlank(_ message: String = NotBlankConstraint.message, groups: Set<Group> = .init())

    /// Creates a `OrConstraint` type with an array of child constraints and a set of validation groups to group by.
    ///
    /// - Parameters:
    ///   - constraints: An array of child constraints.
    ///   - groups: A set of validation groups to group by. Defaults to an empty set.
    case or(_ constraints: [Constraint], groups: Set<Group> = .init())

    /// Creates a `RegexConstraint` type with a custom error message and a set of validation groups to group by.
    ///
    /// - Parameters:
    ///   - message: A custom error message. Defaults to the default error message.
    ///   - groups: A set of validation groups to group by. Defaults to an empty set.
    case regex(_ message: String = RegexConstraint.message, groups: Set<Group> = .init())

    /// Creates a `URLConstraint` type with a file URL flag, a custom error message, and a set of validation groups to group by.
    ///
    /// - Parameters:
    ///   - message: A custom error message. Defaults to the default error message.
    ///   - isFileURL: Indicates whether it is a file URL or not. Defaults to `false`.
    ///   - groups: A set of validation groups to group by. Defaults to an empty set.
    case url(_ message: String = URLConstraint.message, isFileURL: Bool, groups: Set<Group> = .init())

    /// Creates a `UUIDConstraint` type with a custom error message and a set of validation groups to group by.
    ///
    /// - Parameters:
    ///   - message: A custom error message. Defaults to the default error message.
    ///   - groups: A set of validation groups to group by. Defaults to an empty set.
    case uuid(_ message: String = UUIDConstraint.message, groups: Set<Group> = .init())

    /// Creates a `VINConstraint` with a custom error message and a set of validation groups to group by.
    ///
    /// - Parameters:
    ///   - message: A custom error message. Defaults to the default error message.
    ///   - groups: A set of validation groups to group by. Defaults to an empty set.
    case vin(_ message: String = VINConstraint.message, groups: Set<Group> = .init())

    /// A matching `Constraint` for a `ConstraintType`.
    public var constraint: Constraint {
        switch self {
        case let .and(constraints, groups): return AndConstraint(constraints, groups: groups)
        case let .blank(message, groups): return BlankConstraint(message, groups: groups)
        case let .email(message, groups): return EmailConstraint(message, groups: groups)
        case let .integer(min, max, minMessage, maxMessage, exactMessage, groups):
            return IntegerConstraint(
                min: min,
                max: max,
                minMessage: minMessage,
                maxMessage: maxMessage,
                exactMessage: exactMessage,
                groups: groups
            )
        case let .ip(message, groups): return IPConstraint(message, groups: groups)
        case let .json(message, groups): return JSONConstraint(message, groups: groups)
        case let .length(min, max, minMessage, maxMessage, exactMessage, groups):
            return LengthConstraint(
                min: min,
                max: max,
                minMessage: minMessage,
                maxMessage: maxMessage,
                exactMessage: exactMessage,
                groups: groups
            )
        case let .notBlank(message, groups): return NotBlankConstraint(message, groups: groups)
        case let .or(constraints, groups): return OrConstraint(constraints, groups: groups)
        case let .regex(message, groups): return RegexConstraint(message, groups: groups)
        case let .url(message, isFileURL, groups):
            return URLConstraint(message, isFileURL: isFileURL, groups: groups)
        case let .uuid(message, groups): return UUIDConstraint(message, groups: groups)
        case let .vin(message, groups): return VINConstraint(message, groups: groups)
        }
    }
}
