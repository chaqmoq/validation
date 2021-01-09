import Foundation

struct UUIDValidator: ConstraintValidator {
    func validate(_ value: String, against constraint: Constraint) throws {
        guard let constraint = constraint as? UUIDConstraint else {
            let message = "The constraint must be of \(String(describing: UUIDConstraint.self)) type."
            throw ValidatorError.invalidArgument(message)
        }

        if UUID(uuidString: value) == nil { throw ConstraintViolation(message: constraint.message) }
    }

    func validate(_ value: String) throws {
        try validate(value, against: UUIDConstraint())
    }
}
