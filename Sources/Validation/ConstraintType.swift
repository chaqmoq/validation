public enum ConstraintType {
    case email(message: String = EmailConstraint.message)
    case integer(
        min: Int = IntegerConstraint.min,
        max: Int = IntegerConstraint.max,
        minMessage: String = IntegerConstraint.minMessage,
        maxMessage: String = IntegerConstraint.maxMessage,
        exactMessage: String = IntegerConstraint.exactMessage
    )
    case length(
        min: UInt = LengthConstraint.min,
        max: UInt = LengthConstraint.max,
        minMessage: String = LengthConstraint.minMessage,
        maxMessage: String = LengthConstraint.maxMessage,
        exactMessage: String = LengthConstraint.exactMessage
    )
    case notBlank(message: String = NotBlankConstraint.message)
    case vin(message: String = VINConstraint.message)

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
