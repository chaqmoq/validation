import Foundation

struct RegexValidator: ConstraintValidator {
    func validate(_ value: String, against constraint: Constraint) throws {
        guard let constraint = constraint as? RegexConstraint else {
            let message = "The constraint must be of \(String(describing: RegexConstraint.self)) type."
            throw Validator.Error.invalidArgument(message)
        }

        if (try? NSRegularExpression(pattern: value)) == nil {
            throw ConstraintViolation(constraint.message)
        }
    }

    func validate(_ value: String) throws {
        try validate(value, against: RegexConstraint())
    }
}
