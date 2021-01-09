/// A constraint to check if at least one of the child constraints is valid or not.
public struct OrConstraint: Constraint {
    /// An array of child constraints.
    public let constraints: [Constraint]

    /// See `Constraint`.
    public let groups: Set<Group>

    /// A validator named `OrValidator` to validate a value.
    public let validator: ConstraintValidator = OrValidator()

    /// Initializes a new instance with an array of child constraints and validation groups to be applied.
    ///
    /// - Parameters:
    ///   - constraints: An array of child constraints.
    ///   - groups: Validation groups to be applied. Defaults to an empty array.
    public init(_ constraints: [Constraint] = .init(), groups: Set<Group> = .init()) {
        self.constraints = constraints
        self.groups = groups
    }
}
