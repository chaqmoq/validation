/// A common protocol for all `Constraint` validators.
public protocol ConstraintValidator {
    /// Validates a value against a`Constraint` with default parameters.
    ///
    /// - Parameters:
    ///   - value: A value to be validated.
    /// - Throws: A `ConstraintViolation` error.
    func validate(_ value: Any?) throws

    /// Validates a value against a`Constraint` with custom parameters.
    ///
    /// - Parameters:
    ///   - value: A value to be validated.
    ///   - constraint: An instance of `Constraint` with custom parameters.
    /// - Throws: A `ConstraintViolation` error.
    func validate(_ value: Any?, against constraint: Constraint) throws
}
