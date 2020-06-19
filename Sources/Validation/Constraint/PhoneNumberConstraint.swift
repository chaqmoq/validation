public struct PhoneNumberConstraint: Constraint {
    public static let message = "This value must be a valid phone number."
    public static let regionCode = "US"

    public let message: String
    public let regionCode: String
    public let validator: ConstraintValidator = PhoneNumberValidator()

    public init(message: String = message, regionCode: String = regionCode) {
        self.message = message
        self.regionCode = regionCode
    }
}
