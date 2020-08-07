/// A constraint to check if all of the child constraints are valid or not.
public struct AndConstraint: Constraint {
    /// An array of child constraints.
    public let constraints: [Constraint]

    /// A validator named `AndValidator` to validate a value.
    public let validator: ConstraintValidator = AndValidator()

    /// Initializes a new instance with an array of child constraints.
    ///
    /// - Parameter constraints: An array of child constraints.
    public init(_ constraints: [Constraint] = .init()) {
        self.constraints = constraints
    }
}
