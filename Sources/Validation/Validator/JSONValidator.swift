import Foundation

struct JSONValidator: ConstraintValidator {
    func validate(_ value: String, against constraints: [Constraint]) throws {
        var constraints = constraints
        if constraints.isEmpty { constraints.append(JSONConstraint()) }

        guard let constraint = constraints.first(where: { $0 is JSONConstraint }) as? JSONConstraint else {
            let message = "The constraint must be of \(String(describing: JSONConstraint.self)) type."
            throw ValidatorError.invalidArgument(message)
        }

        if let data = value.data(using: .utf8) {
            do {
                _ = try JSONSerialization.jsonObject(with: data)
            } catch {
                throw ConstraintViolation(message: constraint.message)
            }
        }
    }
}
