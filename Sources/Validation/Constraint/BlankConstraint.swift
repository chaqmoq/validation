public struct BlankConstraint: Constraint {
    public static let message = "This value must be blank."

    public let message: String
    public let validator: ConstraintValidator = BlankValidator()

    public init(message: String = message) {
        self.message = message
    }
}
