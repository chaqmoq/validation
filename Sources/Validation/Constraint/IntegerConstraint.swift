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

    /// See `Constraint`.
    public let groups: Set<Group>

    /// A validator named `IntegerValidator` to validate a value.
    public let validator: ConstraintValidator = IntegerValidator()

    /// Initializes a new instance with an exact value, custom error message, and a set of validation groups to group by.
    ///
    /// - Parameters:
    ///   - exact: An exact value.
    ///   - exactMessage: A custom error message to show for an exact value violation. Defaults to the default exact value violation error message.
    ///   - groups: A set of validation groups to group by. Defaults to an empty set.
    public init(exact: Int, exactMessage: String = exactMessage, groups: Set<Group> = .init()) {
        self.init(
            min: exact,
            max: exact,
            minMessage: IntegerConstraint.minMessage,
            maxMessage: IntegerConstraint.maxMessage,
            exactMessage: exactMessage,
            groups: groups
        )
    }

    /// Initializes a new instance with minimum/maximum values, custom minimum/maximum error messages, and a set of validation groups to group by.
    ///
    /// - Parameters:
    ///   - min: A custom minimum value. Defaults to the default minimum value.
    ///   - max: A custom maximum value. Defaults to the default maximum value.
    ///   - minMessage: A custom error message to show for a minimum value violation. Defaults to the default minimum value violation error message.
    ///   - maxMessage: A custom error message to show for a maximum value violation. Defaults to the default maximum value violation error message.
    ///   - exactMessage: A custom error message to show for an exact value violation. Defaults to the default exact value violation error message.
    ///   - groups: A set of validation groups to group by. Defaults to an empty set.
    public init(
        min: Int = min,
        max: Int = max,
        minMessage: String = minMessage,
        maxMessage: String = maxMessage,
        exactMessage: String = exactMessage,
        groups: Set<Group> = .init()
    ) {
        self.min = min
        self.max = max
        self.minMessage = String(format: minMessage, min)
        self.maxMessage = String(format: maxMessage, max)
        self.exactMessage = self.min == self.max ? String(format: exactMessage, self.min) : exactMessage
        self.groups = groups
    }
}
