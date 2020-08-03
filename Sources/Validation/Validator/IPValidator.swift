import Foundation

struct IPValidator: ConstraintValidator {
    static let pattern = "^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\." +
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.([01]?\\d\\d?|2[0-4]\\d|25[0-5])$"

    func validate(_ value: String, against constraints: [Constraint]) throws {
        var constraints = constraints
        if constraints.isEmpty { constraints.append(IPConstraint()) }

        guard let constraint = constraints.first(where: { $0 is IPConstraint }) as? IPConstraint else {
            let message = "The constraint must be of \(String(describing: IPConstraint.self)) type."
            throw ValidatorError.invalidArgument(message)
        }

        guard let regex = try? NSRegularExpression(pattern: IPValidator.pattern) else { return }
        let range = NSRange(location: 0, length: value.utf8.count)
        if regex.firstMatch(in: value, range: range) == nil { throw ConstraintViolation(message: constraint.message) }
    }
}
