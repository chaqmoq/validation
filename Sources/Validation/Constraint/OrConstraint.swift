/// A constraint to check if at least one of the child constraints is valid or not.
public struct OrConstraint: Constraint {
    /// A default error message to show if no custom error message is provided.
    public static let message = "This value must satisfy at least one of the constraints."

    /// A list of child constraints.
    public let constraints: [Constraint]

    /// A custom error message.
    public let message: String

    /// A validator named `OrValidator` to validate a value.
    public let validator: ConstraintValidator = OrValidator()

    /// Initializes a new instance with a list of child constraints and a custom error message.
    ///
    /// - Parameters:
    ///   - constraints: A list of child constraints.
    ///   - message: A custom error message. Defaults to a default error message.
    public init(_ constraints: Constraint..., message: String = message) {
        self.constraints = constraints
        self.message = message
    }
}
