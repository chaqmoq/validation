public struct IntegerConstraint: Constraint {
    public static let minMessage = "This value is too small. It must be greater than or equal to %d."
    public static let maxMessage = "This value is too big. It must be less than or equal to %d."
    public static let exactMessage = "This value must be %d."

    public let min: Int
    public let max: Int
    public let minMessage: String
    public let maxMessage: String
    public let exactMessage: String
    public let validator: ConstraintValidator = IntegerValidator()

    public init(
        exact: Int,
        minMessage: String = minMessage,
        maxMessage: String = maxMessage,
        exactMessage: String = exactMessage
    ) {
        self.init(min: exact, max: exact, minMessage: minMessage, maxMessage: maxMessage, exactMessage: exactMessage)
    }

    public init(
        min: Int = Int.min,
        max: Int = Int.max,
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
