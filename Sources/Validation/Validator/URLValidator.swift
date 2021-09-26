import Foundation

struct URLValidator: ConstraintValidator {
    func validate(_ value: Encodable?) throws {
        try validate(value, against: URLConstraint())
    }

    func validate(_ value: Encodable?, against constraint: Constraint) throws {
        let value = try assertPrimitive(value)
        let constraint = try assertConstraintType(URLConstraint.self, for: constraint)

        if let url = URL(string: value) {
            if constraint.isFileURL {
                if !url.isFileURL { throw ConstraintViolation(constraint.message) }
            } else {
                if url.scheme == nil || url.host == nil { throw ConstraintViolation(constraint.message) }
            }
        } else {
            throw ConstraintViolation(constraint.message)
        }
    }
}
