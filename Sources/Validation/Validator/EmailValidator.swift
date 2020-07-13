import Foundation

struct EmailValidator: ConstraintValidator {
    static let pattern = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" +
    "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
    "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" +
    "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" +
    "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
    "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
    "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"

    func validate(_ value: String, against constraints: [Constraint]) throws {
        var constraints = constraints
        if constraints.isEmpty { constraints.append(EmailConstraint()) }

        guard let constraint = constraints.first(where: { $0 is EmailConstraint }) as? EmailConstraint else {
            throw ValidatorError.invalidArgument(
                "The constraint must be of \(String(describing: EmailConstraint.self)) type."
            )
        }

        if value.isEmpty { return }
        guard let regex = try? NSRegularExpression(pattern: EmailValidator.pattern) else { return }
        let range = NSRange(location: 0, length: value.utf8.count)

        if regex.firstMatch(in: value, range: range) == nil {
            throw ConstraintViolation(message: constraint.message)
        }
    }
}
