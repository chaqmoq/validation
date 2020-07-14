/// A constraint to validate if a value is not blank.
public struct NotBlankConstraint: Constraint {
    /// A default error message to show if no custom error message is provided.
    public static let message = "This value must not be blank."

    /// A custom error message.
    public let message: String

    /// A validator named `NotBlankValidator` to validate a value.
    public let validator: ConstraintValidator = NotBlankValidator()

    /// Initializes a new instance with a custom error message.
    ///
    /// - Parameter message: A custom error message. Defaults to a default error message.
    public init(message: String = message) {
        self.message = message
    }
}
