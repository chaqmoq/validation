/// A validation group is used to group constraints and apply validation based on validation groups provided by `Validator`.
public struct Group: ExpressibleByStringLiteral, Hashable {
    /// A default validation group.
    public static let `default`: Group = "default"

    /// A name for a validation group.
    public let name: String

    /// See `ExpressibleByStringLiteral`.
    public init(stringLiteral name: String) {
        self.name = name
    }
}
