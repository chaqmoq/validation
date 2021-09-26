import Foundation

struct JSONValidator: ConstraintValidator {
    func validate(_ value: Encodable?) throws {
        try validate(value, against: JSONConstraint())
    }

    func validate(_ value: Encodable?, against constraint: Constraint) throws {
        let value = try assertPrimitive(value)
        let constraint = try assertConstraintType(JSONConstraint.self, for: constraint)

        if let data = value.data(using: .utf8) {
            do {
                _ = try JSONSerialization.jsonObject(with: data)
            } catch {
                throw ConstraintViolation(constraint.message)
            }
        }
    }
}
