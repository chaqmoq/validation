/// A constraint to validate if a value is not blank.
public struct NotBlankConstraint: Constraint {
    /// A default error message to show if no custom error message is provided.
    public static let message = "This value must not be blank."

    /// A custom error message.
    public let message: String

    /// See `Constraint`.
    public let groups: Set<Group>

    /// A validator named `NotBlankValidator` to validate a value.
    public let validator: ConstraintValidator = NotBlankValidator()

    /// Initializes a new instance with a custom error message and validation groups to group by.
    ///
    /// - Parameters:
    ///   - message: A custom error message. Defaults to the default error message.
    ///   - groups: Validation groups to group by. Defaults to an empty set.
    public init(_ message: String = message, groups: Set<Group> = .init()) {
        self.message = message
        self.groups = groups
    }
}
