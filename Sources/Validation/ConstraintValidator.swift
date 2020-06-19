public protocol ConstraintValidator {
    func validate(_ value: String, against constraints: Constraint...) throws
    func validate(_ value: String, against constraints: [Constraint]) throws
}
