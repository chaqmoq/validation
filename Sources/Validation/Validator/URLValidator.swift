import Foundation

struct URLValidator: ConstraintValidator {
    func validate(_ value: String, against constraints: [Constraint]) throws {
        var constraints = constraints
        if constraints.isEmpty { constraints.append(URLConstraint()) }

        guard let constraint = constraints.first(where: { $0 is URLConstraint }) as? URLConstraint else {
            let message = "The constraint must be of \(String(describing: URLConstraint.self)) type."
            throw ValidatorError.invalidArgument(message)
        }

        if let url = URL(string: value) {
            if constraint.isFileURL {
                if !url.isFileURL {
                    throw ConstraintViolation(message: constraint.message)
                }
            } else {
                if url.scheme == nil || url.host == nil {
                    throw ConstraintViolation(message: constraint.message)
                }
            }
        } else {
            throw ConstraintViolation(message: constraint.message)
        }
    }
}
