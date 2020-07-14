/// A simplified API for the existing `Constraint`s.
public enum ConstraintType {
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

    /// Creates an `NotBlankConstraint` type with a custom error message.
    ///
    /// - Parameter message: A custom error message. Defaults to a default error message.
    case notBlank(message: String = NotBlankConstraint.message)

    /// Creates an `VINConstraint` with a custom error message.
    ///
    /// - Parameter message: A custom error message. Defaults to a default error message.
    case vin(message: String = VINConstraint.message)

    /// A matching `Constraint` for the `ConstraintType`.
    public var constraint: Constraint {
        switch self {
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
        case .vin(let message):
            return VINConstraint(message: message)
        }
    }
}
