import Foundation

struct JSONValidator: ConstraintValidator {
    func validate(_ value: String, against constraint: Constraint) throws {
        guard let constraint = constraint as? JSONConstraint else {
            let message = "The constraint must be of \(String(describing: JSONConstraint.self)) type."
            throw ValidatorError.invalidArgument(message)
        }

        if let data = value.data(using: .utf8) {
            do {
                _ = try JSONSerialization.jsonObject(with: data)
            } catch {
                throw ConstraintViolation(constraint.message)
            }
        }
    }

    func validate(_ value: String) throws {
        try validate(value, against: JSONConstraint())
    }
}
