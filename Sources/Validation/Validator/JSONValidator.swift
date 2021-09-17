import Foundation

struct JSONValidator: ConstraintValidator {
    func validate(_ value: Any?) throws {
        try validate(value, against: JSONConstraint())
    }

    func validate(_ value: Any?, against constraint: Constraint) throws {
        guard let constraint = constraint as? JSONConstraint else {
            let message = "The constraint must be of \(String(describing: JSONConstraint.self)) type."
            throw Validator.Error.invalidArgument(message)
        }

        let value = "\(value ?? "")"

        if let data = value.data(using: .utf8) {
            do {
                _ = try JSONSerialization.jsonObject(with: data)
            } catch {
                throw ConstraintViolation(constraint.message)
            }
        }
    }
}
