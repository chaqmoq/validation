/// A common protocol for all `Constraint`s.
public protocol Constraint {
    /// A `ConstraintValidator` to validate a value.
    var validator: ConstraintValidator { get }
}
