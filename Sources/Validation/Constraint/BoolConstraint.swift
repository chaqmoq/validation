/// A constraint to validate if a value is a valid boolean value.
public struct BoolConstraint: Constraint {
    /// A default error message to show if no custom error message is provided.
    public static let message = "This value must be either true or false."

    /// A custom error message.
    public let message: String

    /// See `Constraint`.
    public let groups: Set<Group>

    /// A validator named `BoolValidator` to validate a value.
    public let validator: ConstraintValidator = BoolValidator()

    /// Initializes a new instance with a custom error message and a set of `Group`s to group by.
    ///
    /// - Parameters:
    ///   - message: A custom error message. Defaults to the default error message.
    ///   - groups: A set of `Group`s to group by. Defaults to an empty set.
    public init(_ message: String = message, groups: Set<Group> = .init()) {
        self.message = message
        self.groups = groups
    }
}
