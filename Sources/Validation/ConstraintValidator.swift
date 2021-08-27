/// A common protocol for all validators.
public protocol ConstraintValidator {
    /// Validates a value against a`Constraint` with default values.
    ///
    /// - Parameters:
    ///   - value: A value to be validated.
    /// - Throws: An error type of `ConstraintViolation`.
    func validate(_ value: String) throws

    /// Validates a value against a`Constraint` with custom values.
    ///
    /// - Parameters:
    ///   - value: A value to be validated.
    ///   - constraint: An instance of `Constraint`.
    /// - Throws: An error type of `ConstraintViolation`.
    func validate(_ value: String, against constraint: Constraint) throws
}
