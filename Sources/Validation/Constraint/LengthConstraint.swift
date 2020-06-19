public struct LengthConstraint: Constraint {
    public static let minMessage = "This value is too short. It must have %d characters or more."
    public static let maxMessage = "This value is too long. It must have %d characters or less."
    public static let exactMessage = "This value must have %d characters."

    public let min: UInt
    public let max: UInt
    public let minMessage: String
    public let maxMessage: String
    public let exactMessage: String
    public let validator: ConstraintValidator = LengthValidator()

    public init(
        exact: UInt,
        minMessage: String = minMessage,
        maxMessage: String = maxMessage,
        exactMessage: String = exactMessage
    ) {
        self.init(min: exact, max: exact, minMessage: minMessage, maxMessage: maxMessage, exactMessage: exactMessage)
    }

    public init(
        min: UInt = 1,
        max: UInt = UInt.max,
        minMessage: String = minMessage,
        maxMessage: String = maxMessage,
        exactMessage: String = exactMessage
    ) {
        self.min = min
        self.max = max
        self.minMessage = String(format: minMessage, min)
        self.maxMessage = String(format: maxMessage, max)
        self.exactMessage = self.min == self.max ? String(format: exactMessage, self.min) : exactMessage
    }
}
