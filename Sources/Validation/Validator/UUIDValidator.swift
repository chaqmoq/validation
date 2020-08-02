import Foundation

struct UUIDValidator: ConstraintValidator {
    func validate(_ value: String, against constraints: [Constraint]) throws {
        var constraints = constraints
        if constraints.isEmpty { constraints.append(UUIDConstraint()) }

        guard let constraint = constraints.first(where: { $0 is UUIDConstraint }) as? UUIDConstraint else {
            let message = "The constraint must be of \(String(describing: UUIDConstraint.self)) type."
            throw ValidatorError.invalidArgument(message)
        }

        if UUID(uuidString: value) == nil { throw ConstraintViolation(message: constraint.message) }
    }
}
