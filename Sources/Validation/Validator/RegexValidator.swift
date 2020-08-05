import Foundation

struct RegexValidator: ConstraintValidator {
    func validate(_ value: String, against constraints: [Constraint]) throws {
        var constraints = constraints
        if constraints.isEmpty { constraints.append(RegexConstraint()) }

        guard let constraint = constraints.first(where: { $0 is RegexConstraint }) as? RegexConstraint else {
            let message = "The constraint must be of \(String(describing: RegexConstraint.self)) type."
            throw ValidatorError.invalidArgument(message)
        }

        if (try? NSRegularExpression(pattern: value)) == nil {
            throw ConstraintViolation(message: constraint.message)
        }
    }
}
