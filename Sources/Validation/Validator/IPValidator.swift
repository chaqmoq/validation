import Foundation

struct IPValidator: ConstraintValidator {
    static let pattern = """
    ^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.\
    ([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.([01]?\\d\\d?|2[0-4]\\d|25[0-5])$
    """

    func validate(_ value: Any?) throws {
        try validate(value, against: IPConstraint())
    }

    func validate(_ value: Any?, against constraint: Constraint) throws {
        guard let constraint = constraint as? IPConstraint else {
            let message = "The constraint must be of \(String(describing: IPConstraint.self)) type."
            throw Validator.Error.invalidArgument(message)
        }

        guard let regex = try? NSRegularExpression(pattern: IPValidator.pattern) else { return }
        let value = "\(value ?? "")"
        let range = NSRange(location: 0, length: value.utf8.count)
        if regex.firstMatch(in: value, range: range) == nil { throw ConstraintViolation(constraint.message) }
    }
}
