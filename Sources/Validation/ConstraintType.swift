/// A simplified API for the existing `Constraint`s.
public enum ConstraintType {
    /// Creates a `AndConstraint` type with an array of child constraints and validation groups to be applied.
    ///
    /// - Parameters:
    ///   - constraints: An array of child constraints.
    ///   - groups: Validation groups to be applied. Defaults to an empty array.
    case and(_ constraints: [Constraint], groups: Set<Group> = .init())

    /// Creates a `BlankConstraint` type with a custom error message and validation groups to be applied.
    ///
    /// - Parameters:
    ///   - message: A custom error message. Defaults to a default error message.
    ///   - groups: Validation groups to be applied. Defaults to an empty array.
    case blank(_ message: String = BlankConstraint.message, groups: Set<Group> = .init())

    /// Creates an `EmailConstraint`type with a custom error message and validation groups to be applied.
    ///
    /// - Parameters:
    ///   - message: A custom error message. Defaults to a default error message.
    ///   - groups: Validation groups to be applied. Defaults to an empty array.
    case email(_ message: String = EmailConstraint.message, groups: Set<Group> = .init())

    /// Creates an `IntegerConstraint`type with minimum/maximum values, custom minimum/maximum error messages,
    /// and validation groups to be applied.
    ///
    /// - Parameters:
    ///   - min: A custom minimum value. Defaults to a default minimum value.
    ///   - max: A custom maximum value. Defaults to a default maximum value.
    ///   - minMessage: A custom error message to show for a minimum value violation. Defaults to a default minimum value violation error message.
    ///   - maxMessage: A custom error message to show for a maximum value violation. Defaults to a default maximum value violation error message.
    ///   - exactMessage: A custom error message to show for an exact value violation. Defaults to a default exact value violation error message.
    ///   - groups: Validation groups to be applied. Defaults to an empty array.
    case integer(
        min: Int = IntegerConstraint.min,
        max: Int = IntegerConstraint.max,
        minMessage: String = IntegerConstraint.minMessage,
        maxMessage: String = IntegerConstraint.maxMessage,
        exactMessage: String = IntegerConstraint.exactMessage,
        groups: Set<Group> = .init()
    )

    /// Creates an `IPConstraint`type with a custom error message and validation groups to be applied.
    ///
    /// - Parameters:
    ///   - message: A custom error message. Defaults to a default error message.
    ///   - groups: Validation groups to be applied. Defaults to an empty array.
    case ip(_ message: String = IPConstraint.message, groups: Set<Group> = .init())

    /// Creates a `JSONConstraint` type with a custom error message and validation groups to be applied.
    ///
    /// - Parameters:
    ///   - message: A custom error message. Defaults to a default error message.
    ///   - groups: Validation groups to be applied. Defaults to an empty array.
    case json(_ message: String = JSONConstraint.message, groups: Set<Group> = .init())

    /// Creates a `LengthConstraint` type with minimum/maximum values, custom minimum/maximum error messages,
    /// and validation groups to be applied.
    ///
    /// - Parameters:
    ///   - min: A custom minimum value. Defaults to a default minimum value.
    ///   - max: A custom maximum value. Defaults to a default maximum value.
    ///   - minMessage: A custom error message to show for a minimum value violation. Defaults to a default minimum value violation error message.
    ///   - maxMessage: A custom error message to show for a maximum value violation. Defaults to a default maximum value violation error message.
    ///   - exactMessage: A custom error message to show for an exact value violation. Defaults to a default exact value violation error message.
    ///   - groups: Validation groups to be applied. Defaults to an empty array.
    case length(
        min: UInt = LengthConstraint.min,
        max: UInt = LengthConstraint.max,
        minMessage: String = LengthConstraint.minMessage,
        maxMessage: String = LengthConstraint.maxMessage,
        exactMessage: String = LengthConstraint.exactMessage,
        groups: Set<Group> = .init()
    )

    /// Creates a `NotBlankConstraint` type with a custom error message and validation groups to be applied.
    ///
    /// - Parameters:
    ///   - message: A custom error message. Defaults to a default error message.
    ///   - groups: Validation groups to be applied. Defaults to an empty array.
    case notBlank(_ message: String = NotBlankConstraint.message, groups: Set<Group> = .init())

    /// Creates a `OrConstraint` type with an array of child constraints and validation groups to be applied.
    ///
    /// - Parameters:
    ///   - constraints: An array of child constraints.
    ///   - groups: Validation groups to be applied. Defaults to an empty array.
    case or(_ constraints: [Constraint], groups: Set<Group> = .init())

    /// Creates a `RegexConstraint` type with a custom error message and validation groups to be applied.
    ///
    /// - Parameters:
    ///   - message: A custom error message. Defaults to a default error message.
    ///   - groups: Validation groups to be applied. Defaults to an empty array.
    case regex(_ message: String = RegexConstraint.message, groups: Set<Group> = .init())

    /// Creates a `URLConstraint` type with a file URL flag, a custom error message, and validation groups to be applied.
    ///
    /// - Parameters:
    ///   - message: A custom error message. Defaults to a default error message.
    ///   - isFileURL: Indicates whether it is a file URL or not. Defaults to `false`.
    ///   - groups: Validation groups to be applied. Defaults to an empty array.
    case url(_ message: String = URLConstraint.message, isFileURL: Bool, groups: Set<Group> = .init())

    /// Creates a `UUIDConstraint` type with a custom error message and validation groups to be applied.
    ///
    /// - Parameters:
    ///   - message: A custom error message. Defaults to a default error message.
    ///   - groups: Validation groups to be applied. Defaults to an empty array.
    case uuid(_ message: String = UUIDConstraint.message, groups: Set<Group> = .init())

    /// Creates a `VINConstraint` with a custom error message and validation groups to be applied.
    ///
    /// - Parameters:
    ///   - message: A custom error message. Defaults to a default error message.
    ///   - groups: Validation groups to be applied. Defaults to an empty array.
    case vin(_ message: String = VINConstraint.message, groups: Set<Group> = .init())

    /// A matching `Constraint` for a `ConstraintType`.
    public var constraint: Constraint {
        switch self {
        case .and(let constraints, let groups):
            return AndConstraint(constraints, groups: groups)
        case .blank(let message, let groups):
            return BlankConstraint(message, groups: groups)
        case .email(let message, let groups):
            return EmailConstraint(message, groups: groups)
        case .integer(let min, let max, let minMessage, let maxMessage, let exactMessage, let groups):
            return IntegerConstraint(
                min: min,
                max: max,
                minMessage: minMessage,
                maxMessage: maxMessage,
                exactMessage: exactMessage,
                groups: groups
            )
        case .ip(let message, let groups):
            return IPConstraint(message, groups: groups)
        case .json(let message, let groups):
            return JSONConstraint(message, groups: groups)
        case .length(let min, let max, let minMessage, let maxMessage, let exactMessage, let groups):
            return LengthConstraint(
                min: min,
                max: max,
                minMessage: minMessage,
                maxMessage: maxMessage,
                exactMessage: exactMessage,
                groups: groups
            )
        case .notBlank(let message, let groups):
            return NotBlankConstraint(message, groups: groups)
        case .or(let constraints, let groups):
            return OrConstraint(constraints, groups: groups)
        case .regex(let message, let groups):
            return RegexConstraint(message, groups: groups)
        case .url(let message, let isFileURL, let groups):
            return URLConstraint(message, isFileURL: isFileURL, groups: groups)
        case .uuid(let message, let groups):
            return UUIDConstraint(message, groups: groups)
        case .vin(let message, let groups):
            return VINConstraint(message, groups: groups)
        }
    }
}
