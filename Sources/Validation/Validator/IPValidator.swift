import Foundation

struct IPValidator: ConstraintValidator {
    static let pattern = """
    ^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.\
    ([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.([01]?\\d\\d?|2[0-4]\\d|25[0-5])$
    """

    func validate(_ value: Encodable?) throws {
        try validate(value, against: IPConstraint())
    }

    func validate(_ value: Encodable?, against constraint: Constraint) throws {
        let value = try assertPrimitive(value)
        let constraint = try assertConstraintType(IPConstraint.self, for: constraint)
        let predicate = NSPredicate(format: "SELF MATCHES %@", Self.pattern)

        if !predicate.evaluate(with: value) {
            throw ConstraintViolation(constraint.message)
        }
    }
}
