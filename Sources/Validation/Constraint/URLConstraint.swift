/// A constraint to validate if a value is URL.
public struct URLConstraint: Constraint {
    /// A default error message to show if no custom error message is provided.
    public static let message = "This value must be a valid URL."

    /// Indicates whether it is a file URL or not.
    public let isFileURL: Bool

    /// A custom error message.
    public let message: String

    /// A validator named `URLValidator` to validate a value.
    public let validator: ConstraintValidator = URLValidator()

    /// Initializes a new instance with a file URL flag and a custom error message.
    ///
    /// - Parameters:
    ///   - isFileURL: Indicates whether it is a file URL or not. Defaults to `false`.
    ///   - message: A custom error message. Defaults to a default error message.
    public init(isFileURL: Bool = false, message: String = message) {
        self.isFileURL = isFileURL
        self.message = message
    }
}
