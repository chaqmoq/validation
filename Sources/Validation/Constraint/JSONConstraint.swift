/// A constraint to validate if a value is a JSON string.
public struct JSONConstraint: Constraint {
    /// A default error message to show if no custom error message is provided.
    public static let message = "This value must be a valid JSON string."

    /// A custom error message.
    public let message: String

    /// See `Constraint`.
    public let groups: Set<Group>

    /// A validator named `JSONValidator` to validate a value.
    public let validator: ConstraintValidator = JSONValidator()

    /// Initializes a new instance with a custom error message and validation groups to be applied.
    ///
    /// - Parameters:
    ///   - message: A custom error message. Defaults to a default error message.
    ///   - groups: Validation groups to be applied. Defaults to an empty array.
    public init(message: String = message, groups: Set<Group> = .init()) {
        self.message = message
        self.groups = groups
    }
}
