struct DateValidator: ConstraintValidator {
    func validate(_ value: Encodable?) throws {
        try validate(value, against: DateConstraint())
    }

    func validate(_ value: Encodable?, against constraint: Constraint) throws {
        let constraint = try assertConstraintType(DateConstraint.self, for: constraint)
        let value = try assertPrimitive(value, dateFormatter: constraint.dateFormatter)

        if constraint.dateFormatter.date(from: value) == nil {
            throw ConstraintViolation(constraint.message)
        }
    }
}
