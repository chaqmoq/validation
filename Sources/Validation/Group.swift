/// Groups constraints and `Validator` runs validations based on them.
public struct Group: ExpressibleByStringLiteral, Hashable {
    /// The default `Group`.
    public static let `default`: Group = "default"

    /// The name of `Group`.
    public let name: String

    /// See `ExpressibleByStringLiteral`.
    public init(stringLiteral name: String) {
        self.name = name
    }

    /// Initializes a new instance.
    ///
    /// - Parameter name: The name of `Group`.
    public init(_ name: String) {
        self.name = name
    }
}
