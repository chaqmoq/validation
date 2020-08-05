/// A constraint to validate if a value is a regular expression.
public struct RegexConstraint: Constraint {
    /// A default error message to show if no custom error message is provided.
    public static let message = "This value must be a valid regular expression."

    /// A custom error message.
    public let message: String

    /// A validator named `RegexValidator` to validate a value.
    public let validator: ConstraintValidator = RegexValidator()

    /// Initializes a new instance with a custom error message.
    ///
    /// - Parameter message: A custom error message. Defaults to a default error message.
    public init(message: String = message) {
        self.message = message
    }
}
