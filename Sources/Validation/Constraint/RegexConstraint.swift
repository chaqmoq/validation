/// A constraint to validate if a value matches a regular expression pattern.
public struct RegexConstraint: Constraint {
    /// A default regular expression pattern that matches to any character(s) or an empty string.
    public static let pattern = ".*"

    /// A default error message to show if no custom error message is provided.
    public static let message = "This value must match a regular expression pattern."

    /// A regular expression pattern.
    public let pattern: String

    /// A custom error message.
    public let message: String

    /// See `Constraint`.
    public let groups: Set<Group>

    /// A validator named `RegexValidator` to validate a value.
    public let validator: ConstraintValidator = RegexValidator()

    /// Initializes a new instance with a regular expression pattern, a custom error message and a set of `Group`s to group by.
    ///
    /// - Parameters:
    ///   - pattern: A regular expression pattern. Matches to any character(s) or an empty string by default.
    ///   - message: A custom error message. Defaults to the default error message.
    ///   - groups: A set of `Group`s to group by. Defaults to an empty set.
    public init(_ pattern: String = pattern, message: String = message, groups: Set<Group> = .init()) {
        self.pattern = pattern
        self.message = message
        self.groups = groups
    }
}
