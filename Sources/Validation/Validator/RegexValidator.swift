import Foundation

struct RegexValidator: ConstraintValidator {
    func validate(_ value: Any?) throws {
        try validate(value, against: RegexConstraint())
    }

    func validate(_ value: Any?, against constraint: Constraint) throws {
        guard let constraint = constraint as? RegexConstraint else {
            let message = "The constraint must be of \(String(describing: RegexConstraint.self)) type."
            throw Validator.Error.invalidArgument(message)
        }

        let value = "\(value ?? "")"
        if (try? NSRegularExpression(pattern: value)) == nil { throw ConstraintViolation(constraint.message) }
    }
}
