/// Enables to validate values against constraints on groups step by step and raise constraint violations for one group at a time.
public struct GroupSequence: ExpressibleByArrayLiteral {
    /// A list of groups to run validation on.
    public let groups: [Group]

    /// Initializes a new instance with a list of groups.
    ///
    /// - Parameter groups: A list of groups.
    public init(_ groups: [Group] = .init()) {
        self.groups = groups.unique
    }

    /// Initializes a new instance with a list of group names.
    ///
    /// - Parameter groupNames: A list of group names.
    public init(_ groupNames: [String]) {
        self.init(groupNames.map { Group($0) })
    }

    /// See `ExpressibleByArrayLiteral`.
    public init(arrayLiteral groups: Group...) {
        self.init(groups)
    }
}
