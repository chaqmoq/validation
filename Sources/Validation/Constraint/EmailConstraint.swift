public struct EmailConstraint: Constraint {
    public static let message = "This value must be a valid email address."

    public let message: String
    public let validator: ConstraintValidator = EmailValidator()

    public init(message: String = message) {
        self.message = message
    }
}
