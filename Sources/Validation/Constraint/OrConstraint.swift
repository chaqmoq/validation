/// A constraint to check if at least one of the child constraints is valid or not.
public struct OrConstraint: Constraint {
    /// An array of child constraints.
    public let constraints: [Constraint]

    /// A validator named `OrValidator` to validate a value.
    public let validator: ConstraintValidator = OrValidator()

    /// Initializes a new instance with an array of child constraints and a custom error message.
    ///
    /// - Parameter constraints: An array of child constraints.
    public init(_ constraints: [Constraint] = .init()) {
        self.constraints = constraints
    }
}
