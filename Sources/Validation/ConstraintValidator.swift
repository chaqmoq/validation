/// A common protocol for all `Constraint` validators.
public protocol ConstraintValidator {
    /// Validates a single primitive `Encodable` value against a `Constraint`with default parameters.
    ///
    /// - Parameters:
    ///   - value: A single primitive `Encodable` value to be validated.
    /// - Throws: A `ConstraintViolation` error.
    func validate(_ value: Encodable?) throws

    /// Validates a single primitive `Encodable` value against a`Constraint` with custom parameters.
    ///
    /// - Parameters:
    ///   - value: A single primitive `Encodable` value to be validated.
    ///   - constraint: An instance of `Constraint` with custom parameters.
    /// - Throws: A `ConstraintViolation` error.
    func validate(_ value: Encodable?, against constraint: Constraint) throws
}
