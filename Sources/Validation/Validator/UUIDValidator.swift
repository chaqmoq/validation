import Foundation

struct UUIDValidator: ConstraintValidator {
    func validate(_ value: Any?) throws {
        try validate(value, against: UUIDConstraint())
    }

    func validate(_ value: Any?, against constraint: Constraint) throws {
        guard let constraint = constraint as? UUIDConstraint else {
            let message = "The constraint must be of \(String(describing: UUIDConstraint.self)) type."
            throw Validator.Error.invalidArgument(message)
        }

        let value = "\(value ?? "")"
        if UUID(uuidString: value) == nil { throw ConstraintViolation(constraint.message) }
    }
}
