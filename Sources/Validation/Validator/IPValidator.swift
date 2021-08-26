import Foundation

struct IPValidator: ConstraintValidator {
    static let pattern = """
    ^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.\
    ([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.([01]?\\d\\d?|2[0-4]\\d|25[0-5])$
    """

    func validate(_ value: String, against constraint: Constraint) throws {
        guard let constraint = constraint as? IPConstraint else {
            let message = "The constraint must be of \(String(describing: IPConstraint.self)) type."
            throw Validator.Error.invalidArgument(message)
        }

        guard let regex = try? NSRegularExpression(pattern: IPValidator.pattern) else { return }
        let range = NSRange(location: 0, length: value.utf8.count)
        if regex.firstMatch(in: value, range: range) == nil { throw ConstraintViolation(constraint.message) }
    }

    func validate(_ value: String) throws {
        try validate(value, against: IPConstraint())
    }
}
