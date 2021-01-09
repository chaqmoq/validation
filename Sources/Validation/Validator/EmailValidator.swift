import Foundation

struct EmailValidator: ConstraintValidator {
    static let pattern = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" +
    "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
    "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" +
    "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" +
    "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
    "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
    "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"

    func validate(_ value: String, against constraint: Constraint) throws {
        guard let constraint = constraint as? EmailConstraint else {
            let message = "The constraint must be of \(String(describing: EmailConstraint.self)) type."
            throw ValidatorError.invalidArgument(message)
        }

        guard let regex = try? NSRegularExpression(pattern: EmailValidator.pattern) else { return }
        let range = NSRange(location: 0, length: value.utf8.count)
        if regex.firstMatch(in: value, range: range) == nil { throw ConstraintViolation(message: constraint.message) }
    }

    func validate(_ value: String) throws {
        try validate(value, against: EmailConstraint())
    }
}
