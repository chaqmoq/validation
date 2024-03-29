/// A constraint to validate if a value is URL.
public struct URLConstraint: Constraint {
    /// A default error message to show if no custom error message is provided.
    public static let message = "This value must be a valid URL."

    /// Indicates whether it is a file URL or not.
    public let isFileURL: Bool

    /// A custom error message.
    public let message: String

    /// See `Constraint`.
    public let groups: Set<Group>

    /// A validator named `URLValidator` to validate a value.
    public let validator: ConstraintValidator = URLValidator()

    /// Initializes a new instance with a file URL flag, a custom error message, and a set of `Group`s to group by.
    ///
    /// - Parameters:
    ///   - message: A custom error message. Defaults to the default error message.
    ///   - isFileURL: Indicates whether it is a file URL or not. Defaults to `false`.
    ///   - groups: A set of `Group`s to group by. Defaults to an empty set.
    public init(_ message: String = message, isFileURL: Bool = false, groups: Set<Group> = .init()) {
        self.message = message
        self.isFileURL = isFileURL
        self.groups = groups
    }
}
