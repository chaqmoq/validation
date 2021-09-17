import Foundation

struct URLValidator: ConstraintValidator {
    func validate(_ value: Any?) throws {
        try validate(value, against: URLConstraint())
    }

    func validate(_ value: Any?, against constraint: Constraint) throws {
        guard let constraint = constraint as? URLConstraint else {
            let message = "The constraint must be of \(String(describing: URLConstraint.self)) type."
            throw Validator.Error.invalidArgument(message)
        }

        let value = "\(value ?? "")"

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
