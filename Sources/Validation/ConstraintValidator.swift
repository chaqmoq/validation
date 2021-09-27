/// A common protocol for all `Constraint` validators.
public protocol ConstraintValidator {
    /// Validates a primitive `Encodable` value against a `Constraint`with default parameters.
    ///
    /// - Parameters:
    ///   - value: A primitive `Encodable` value to be validated.
    /// - Throws: A `Validator.Error` if the value is not of primitive type or a `ConstraintViolation` if the value doesn't satisfy a
    /// `Constraint`.
    func validate(_ value: Encodable?) throws

    /// Validates a primitive `Encodable` value against a`Constraint` with custom parameters.
    ///
    /// - Parameters:
    ///   - value: A primitive `Encodable` value to be validated.
    ///   - constraint: An instance of `Constraint` with custom parameters.
    /// - Throws: A `Validator.Error` if the value is not of primitive type or a `ConstraintViolation` if the value doesn't satisfy a
    /// `Constraint`.
    func validate(_ value: Encodable?, against constraint: Constraint) throws
}
