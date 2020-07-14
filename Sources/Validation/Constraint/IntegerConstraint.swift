/// A constraint to validate if a value is an integer number.
public struct IntegerConstraint: Constraint {
    /// A default minimum value to set if no minimum value is provided.
    public static let min = Int.min

    /// A default maximum value to set if no maximum value is provided.
    public static let max = Int.max

    /// A default error message to show for a minimum value violation.
    public static let minMessage = "This value is too small. It must be greater than or equal to %d."

    /// A default error message to show for a maximum value violation.
    public static let maxMessage = "This value is too big. It must be less than or equal to %d."

    /// A default error message to show for an exact value violation.
    public static let exactMessage = "This value must be %d."

    /// A custom minimum value.
    public let min: Int

    /// A custom maximum value.
    public let max: Int

    /// A custom error message to show for a minimum value violation.
    public let minMessage: String

    /// A custom error message to show for a maximum value violation.
    public let maxMessage: String

    /// A custom error message to show for an exact value violation.
    public let exactMessage: String

    /// A validator named `IntegerValidator` to validate a value.
    public let validator: ConstraintValidator = IntegerValidator()

    /// Initializes a new instance with an exact value and custom error message.
    ///
    /// - Parameters:
    ///   - exact: An exact value.
    ///   - exactMessage: A custom error message to show for an exact value violation. Defaults to a default exact value violation error message.
    public init(exact: Int, exactMessage: String = exactMessage) {
        self.init(
            min: exact,
            max: exact,
            minMessage: IntegerConstraint.minMessage,
            maxMessage: IntegerConstraint.maxMessage,
            exactMessage: exactMessage
        )
    }

    /// Initializes a new instance with minimum/maximum values and custom minimum/maximum error messages.
    ///
    /// - Parameters:
    ///   - min: A custom minimum value. Defaults to a default minimum value.
    ///   - max: A custom maximum value. Defaults to a default maximum value.
    ///   - minMessage: A custom error message to show for a minimum value violation. Defaults to a default minimum value violation error message.
    ///   - maxMessage: A custom error message to show for a maximum value violation. Defaults to a default maximum value violation error message.
    ///   - exactMessage: A custom error message to show for an exact value violation. Defaults to a default exact value violation error message.
    public init(
        min: Int = min,
        max: Int = max,
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
