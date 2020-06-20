import class Foundation.NSPredicate

struct EmailValidator: ConstraintValidator {
    func validate(_ value: String, against constraints: Constraint...) throws {
        try validate(value, against: constraints)
    }

    func validate(_ value: String, against constraints: [Constraint]) throws {
        var constraints = constraints

        if constraints.isEmpty {
            constraints.append(EmailConstraint())
        }

        guard let constraint = constraints.first(where: { $0 is EmailConstraint }) as? EmailConstraint else {
            throw ValidatorError.invalidArgument(
                "The constraint must be of \(String(describing: EmailConstraint.self)) type."
            )
        }

        if !isValidEmail(value) {
            throw ConstraintViolation(message: constraint.message)
        }
    }
}

extension EmailValidator {
    private func isValidEmail(_ email: String) -> Bool {
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "^\\b.+@.+\\..+\\b$")

        if !emailPredicate.evaluate(with: email) {
            return false
        }

        let (username, domain, tld) = splitEmail(email)
        let usernamePredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z.!#$%&'*+-/=?^_`{|}~]+")

        if username.isEmpty ||
            username.hasPrefix(".") ||
            username.hasSuffix(".") ||
            username.range(of: "..") != nil ||
            !usernamePredicate.evaluate(with: username) {
            return false
        }

        let domainPredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z.-]+")

        if domain.isEmpty ||
            domain.hasPrefix(".") ||
            domain.hasSuffix(".") ||
            domain.range(of: "..") != nil ||
            !domainPredicate.evaluate(with: domain) {
            return false
        }

        let tldPredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Za-z][A-Z0-9a-z-]{0,22}[A-Z0-9a-z]")

        if !tldPredicate.evaluate(with: tld) {
            return false
        }

        return true
    }

    private func splitEmail(_ email: String) -> (String, String, String) {
        var username = ""
        var domain = ""
        var tld = ""

        if let atRange = email.range(of: "@") {
            username = String(email[email.startIndex..<atRange.lowerBound])

            if let dotRange = email.range(of: ".", options: .backwards) {
                domain = String(email[atRange.upperBound..<dotRange.lowerBound])
                tld = String(email[dotRange.upperBound..<email.endIndex])
            }
        }

        return (username, domain, tld)
    }
}
