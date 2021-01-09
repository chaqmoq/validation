/// A common protocol for all `Constraint`s.
public protocol Constraint {
    /// Validation groups to be applied.
    var groups: Set<Group> { get }

    /// A `ConstraintValidator` to validate a value.
    var validator: ConstraintValidator { get }
}
