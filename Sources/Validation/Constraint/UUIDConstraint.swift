/// A constraint to validate if a value is UUID.
public struct UUIDConstraint: Constraint {
    /// A default error message to show if no custom error message is provided.
    public static let message = "This value must be a valid UUID."

    /// A custom error message.
    public let message: String

    /// A validator named `UUIDValidator` to validate a value.
    public let validator: ConstraintValidator = UUIDValidator()

    /// Initializes a new instance with a custom error message.
    ///
    /// - Parameter message: A custom error message. Defaults to a default error message.
    public init(message: String = message) {
        self.message = message
    }
}
