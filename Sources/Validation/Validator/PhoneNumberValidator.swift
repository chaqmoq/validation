import PhoneNumberKit

struct PhoneNumberValidator: ConstraintValidator {
    private let phoneNumberKit: PhoneNumberKit

    init() {
        self.phoneNumberKit = PhoneNumberKit()
    }

    func validate(_ value: String, against constraints: Constraint...) throws {
        try validate(value, against: constraints)
    }

    func validate(_ value: String, against constraints: [Constraint]) throws {
        var constraints = constraints

        if constraints.isEmpty {
            constraints.append(PhoneNumberConstraint())
        }

        guard let constraint = constraints.first(where: { $0 is PhoneNumberConstraint }) as? PhoneNumberConstraint else {
            throw ValidatorError.invalidArgument(
                message: "The constraint must be of \(String(describing: PhoneNumberConstraint.self)) type."
            )
        }

        let value = value.trimmingCharacters(in: .whitespacesAndNewlines)

        if !value.isEmpty && !phoneNumberKit.isValidPhoneNumber(value, withRegion: constraint.regionCode) {
            throw ConstraintViolation(message: constraint.message)
        }
    }
}
