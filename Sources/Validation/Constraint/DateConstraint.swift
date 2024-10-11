import Foundation

/// A constraint to validate if a value is a valid date.
public struct DateConstraint: Constraint {
    /// A default error message to show if no custom error message is provided.
    public static let message = "This value must be a valid date."

    /// A custom `DateFormatter`.
    public let dateFormatter: DateFormatter

    /// A custom error message.
    public let message: String

    /// See `Constraint`.
    public let groups: Set<Group>

    /// A validator named `DateValidator` to validate a value.
    public let validator: ConstraintValidator = DateValidator()

    /// Initializes a new instance with a custom `DateFormatter`, a custom error message and a set of `Group`s to group by.
    ///
    /// - Parameters:
    ///   - dateFormatter: A custom `DateFormatter`. Defaults to the "iso8601" `DateFormatter`.
    ///   - message: A custom error message. Defaults to the default error message.
    ///   - groups: A set of `Group`s to group by. Defaults to an empty set.
    public init(_ dateFormatter: DateFormatter = .iso8601, message: String = message, groups: Set<Group> = .init()) {
        self.dateFormatter = dateFormatter
        self.message = message
        self.groups = groups
    }
}
