public struct VINConstraint: Constraint {
    public static let message = "This value must be a valid VIN."

    public let message: String
    public let validator: ConstraintValidator = VINValidator()

    public init(message: String = message) {
        self.message = message
    }
}
