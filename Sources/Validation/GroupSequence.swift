/// Validates values against constraints on `Group`s step by step and raises constraint violations for one `Group` at a time.
public struct GroupSequence: ExpressibleByArrayLiteral {
    /// An array of `Group`'s.
    public let groups: [Group]

    /// Initializes a new instance with an array of `Group`s.
    ///
    /// - Parameter groups: An array of `Group`s.
    public init(_ groups: [Group]) {
        self.groups = groups.unique
    }

    /// Initializes a new instance with an array of `Group` names.
    ///
    /// - Parameter groupNames: An array of `Group` names.
    public init(_ groupNames: [String]) {
        self.init(groupNames.map { Group($0) })
    }

    /// See `ExpressibleByArrayLiteral`.
    public init(arrayLiteral groups: Group...) {
        self.init(groups)
    }
}
