/// A simplified API for the existing `Constraint`s.
public enum ConstraintType {
    /// Creates a `BlankConstraint` type with a custom error message.
    ///
    /// - Parameter message: A custom error message. Defaults to a default error message.
    case blank(message: String = BlankConstraint.message)

    /// Creates an `EmailConstraint`type with a custom error message.
    ///
    /// - Parameter message: A custom error message. Defaults to a default error message.
    case email(message: String = EmailConstraint.message)

    /// Creates an `IntegerConstraint`type with minimum/maximum values and custom minimum/maximum error messages.
    ///
    /// - Parameters:
    ///   - min: A custom minimum value. Defaults to a default minimum value.
    ///   - max: A custom maximum value. Defaults to a default maximum value.
    ///   - minMessage: A custom error message to show for a minimum value violation. Defaults to a default minimum value violation error message.
    ///   - maxMessage: A custom error message to show for a maximum value violation. Defaults to a default maximum value violation error message.
    ///   - exactMessage: A custom error message to show for an exact value violation. Defaults to a default exact value violation error message.
    case integer(
        min: Int = IntegerConstraint.min,
        max: Int = IntegerConstraint.max,
        minMessage: String = IntegerConstraint.minMessage,
        maxMessage: String = IntegerConstraint.maxMessage,
        exactMessage: String = IntegerConstraint.exactMessage
    )

    /// Creates an `IPConstraint`type with a custom error message.
    ///
    /// - Parameter message: A custom error message. Defaults to a default error message.
    case ip(message: String = IPConstraint.message)

    /// Creates a `JSONConstraint` type with a custom error message.
    ///
    /// - Parameter message: A custom error message. Defaults to a default error message.
    case json(message: String = JSONConstraint.message)

    /// Creates a `LengthConstraint` type with minimum/maximum values and custom minimum/maximum error messages.
    ///
    /// - Parameters:
    ///   - min: A custom minimum value. Defaults to a default minimum value.
    ///   - max: A custom maximum value. Defaults to a default maximum value.
    ///   - minMessage: A custom error message to show for a minimum value violation. Defaults to a default minimum value violation error message.
    ///   - maxMessage: A custom error message to show for a maximum value violation. Defaults to a default maximum value violation error message.
    ///   - exactMessage: A custom error message to show for an exact value violation. Defaults to a default exact value violation error message.
    case length(
        min: UInt = LengthConstraint.min,
        max: UInt = LengthConstraint.max,
        minMessage: String = LengthConstraint.minMessage,
        maxMessage: String = LengthConstraint.maxMessage,
        exactMessage: String = LengthConstraint.exactMessage
    )

    /// Creates a `NotBlankConstraint` type with a custom error message.
    ///
    /// - Parameter message: A custom error message. Defaults to a default error message.
    case notBlank(message: String = NotBlankConstraint.message)

    /// Creates a `RegexConstraint` type with a custom error message.
    ///
    /// - Parameter message: A custom error message. Defaults to a default error message.
    case regex(message: String = RegexConstraint.message)

    /// Creates a `URLConstraint` type with a file URL flag and a custom error message.
    ///
    /// - Parameters:
    ///   - isFileURL: Indicates whether it is a file URL or not. Defaults to `false`.
    ///   - message: A custom error message. Defaults to a default error message.
    case url(isFileURL: Bool, message: String = URLConstraint.message)

    /// Creates a `UUIDConstraint` type with a custom error message.
    ///
    /// - Parameter message: A custom error message. Defaults to a default error message.
    case uuid(message: String = UUIDConstraint.message)

    /// Creates a `VINConstraint` with a custom error message.
    ///
    /// - Parameter message: A custom error message. Defaults to a default error message.
    case vin(message: String = VINConstraint.message)

    /// A matching `Constraint` for the `ConstraintType`.
    public var constraint: Constraint {
        switch self {
        case .blank(let message):
            return BlankConstraint(message: message)
        case .email(let message):
            return EmailConstraint(message: message)
        case .integer(let min, let max, let minMessage, let maxMessage, let exactMessage):
            return IntegerConstraint(
                min: min,
                max: max,
                minMessage: minMessage,
                maxMessage: maxMessage,
                exactMessage: exactMessage
            )
        case .ip(let message):
            return IPConstraint(message: message)
        case .json(let message):
            return JSONConstraint(message: message)
        case .length(let min, let max, let minMessage, let maxMessage, let exactMessage):
            return LengthConstraint(
                min: min,
                max: max,
                minMessage: minMessage,
                maxMessage: maxMessage,
                exactMessage: exactMessage
            )
        case .notBlank(let message):
            return NotBlankConstraint(message: message)
        case .regex(let message):
            return RegexConstraint(message: message)
        case .url(let isFileURL, let message):
            return URLConstraint(isFileURL: isFileURL, message: message)
        case .uuid(let message):
            return UUIDConstraint(message: message)
        case .vin(let message):
            return VINConstraint(message: message)
        }
    }
}
