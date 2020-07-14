/// A constraint to validate if a value is blank.
public struct BlankConstraint: Constraint {
    /// A default error message to show if no custom error message is provided.
    public static let message = "This value must be blank."

    /// A custom error message.
    public let message: String

    /// A validator named `BlankValidator` to validate a value.
    public let validator: ConstraintValidator = BlankValidator()

    /// Initializes a new instance with a custom error message.
    ///
    /// - Parameter message: A custom error message. Defaults to a default error message.
    public init(message: String = message) {
        self.message = message
    }
}
