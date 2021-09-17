/// A common protocol for all validators.
public protocol ConstraintValidator {
    /// Validates a value against a`Constraint` with default values.
    ///
    /// - Parameters:
    ///   - value: A value to be validated.
    /// - Throws: A `ConstraintViolation` error.
    func validate(_ value: Any?) throws

    /// Validates a value against a`Constraint` with custom values.
    ///
    /// - Parameters:
    ///   - value: A value to be validated.
    ///   - constraint: An instance of `Constraint`.
    /// - Throws: A `ConstraintViolation` error.
    func validate(_ value: Any?, against constraint: Constraint) throws
}
