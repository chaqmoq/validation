import Foundation

struct HexColorValidator: ConstraintValidator {
    func validate(_ value: Encodable?) throws {
        try validate(value, against: HexColorConstraint())
    }

    func validate(_ value: Encodable?, against constraint: Constraint) throws {
        var value = try assertPrimitive(value)
        let constraint = try assertConstraintType(HexColorConstraint.self, for: constraint)

        if value.hasPrefix("#") {
            value.removeFirst()
        }

        let count = value.count
        guard count == 6 || count == 8, UInt32(value, radix: 16) != nil
        else { throw ConstraintViolation(constraint.message) }
    }
}
