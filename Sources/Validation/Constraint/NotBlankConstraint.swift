public struct NotBlankConstraint: Constraint {
    public static let message = "This value must not be blank."

    public let message: String
    public let validator: ConstraintValidator = NotBlankValidator()

    public init(message: String = message) {
        self.message = message
    }
}
