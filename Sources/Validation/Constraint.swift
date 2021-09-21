/// A common protocol for all `Constraint`s.
public protocol Constraint {
    /// A set of validation groups to group by.
    var groups: Set<Group> { get }

    /// A concrete type of `ConstraintValidator` to validate a value.
    var validator: ConstraintValidator { get }
}
