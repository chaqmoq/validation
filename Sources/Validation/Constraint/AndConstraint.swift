/// A constraint to check if all of the child constraints are valid or not.
public struct AndConstraint: Constraint {
    /// An array of child constraints.
    public let constraints: [Constraint]

    /// See `Constraint`.
    public let groups: Set<Group>

    /// A validator named `AndValidator` to validate a value.
    public let validator: ConstraintValidator = AndValidator()

    /// Initializes a new instance with an array of child constraints and a set of `Group`s to group by.
    ///
    /// - Parameters:
    ///   - constraints: An array of child constraints.
    ///   - groups: A set of `Group`s to group by. Defaults to an empty set.
    public init(_ constraints: [Constraint] = .init(), groups: Set<Group> = .init()) {
        self.constraints = constraints
        self.groups = groups
    }
}
