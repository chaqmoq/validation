/// A constraint to validate if a value exists in predefined choices.
public struct ChoiceConstraint: Constraint {
    /// A default error message to show if no custom error message is provided.
    public static let message = "This value must be a valid choice."

    /// A list of choices.
    public let choices: [any Encodable & Equatable]

    /// A custom error message.
    public let message: String

    /// See `Constraint`.
    public let groups: Set<Group>

    /// A validator named `ChoiceValidator` to validate a value.
    public let validator: ConstraintValidator = ChoiceValidator()

    /// Initializes a new instance with a list of choices, a custom error message and a set of `Group`s to group by.
    ///
    /// - Parameters:
    ///   - choices: A list of choices. Defaults to an empty array.
    ///   - message: A custom error message. Defaults to the default error message.
    ///   - groups: A set of `Group`s to group by. Defaults to an empty set.
    public init(
        _ choices: [any Encodable & Equatable] = .init(),
        message: String = message,
        groups: Set<Group> = .init()
    ) {
        self.choices = choices
        self.message = message
        self.groups = groups
    }
}
