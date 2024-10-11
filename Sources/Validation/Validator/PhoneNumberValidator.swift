import Foundation
import PhoneNumberKit

struct PhoneNumberValidator: ConstraintValidator {
    private let phoneNumberUtility = PhoneNumberUtility()

    func validate(_ value: Encodable?) throws {
        try validate(value, against: PhoneNumberConstraint())
    }

    func validate(_ value: Encodable?, against constraint: Constraint) throws {
        let value = try assertPrimitive(value)
        let constraint = try assertConstraintType(PhoneNumberConstraint.self, for: constraint)

        do {
            _ = try phoneNumberUtility.parse(value)
        } catch {
            throw ConstraintViolation(constraint.message)
        }
    }
}
