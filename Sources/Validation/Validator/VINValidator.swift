struct VINValidator: ConstraintValidator {
    static let vinMinLength = 17
    static let vinMaxLength = 18
    static let allowedCharacters = "0123456789.ABCDEFGH..JKLMN.P.R..STUVWXYZ"
    static let map = "0123456789X"
    static let weights = "8765432X098765432"
}

extension VINValidator {
    func validate(_ value: Any?) throws {
        try validate(value, against: VINConstraint())
    }

    func validate(_ value: Any?, against constraint: Constraint) throws {
        guard let constraint = constraint as? VINConstraint else {
            let message = "The constraint must be of \(String(describing: VINConstraint.self)) type."
            throw Validator.Error.invalidArgument(message)
        }

        let vin = normalize(vin: "\(value ?? "")")

        if vin.count != VINValidator.vinMinLength || getCheckDigit(for: vin) != vin[8] {
            throw ConstraintViolation(constraint.message)
        }
    }

    func normalize(vin: String) -> String {
        var vin = vin
        if vin.starts(with: "I"), vin.count == VINValidator.vinMaxLength { vin.removeFirst() }

        return vin
    }
}

extension VINValidator {
    private func transliterate(character: Character) -> Int? {
        if character == "." { return nil }
        if let value = VINValidator.allowedCharacters.firstIntIndex(of: character) { return value % 10 }

        return nil
    }

    private func getCheckDigit(for vin: String) -> Character? {
        let map = VINValidator.map
        var sum = 0

        for index in 0 ..< VINValidator.vinMinLength {
            let vinCharacter = vin[index]
            let weightCharacter = VINValidator.weights[index]

            if let characterIndex = transliterate(character: vinCharacter),
               let value = map.firstIntIndex(of: weightCharacter)
            {
                sum += characterIndex * value
            } else {
                return nil
            }
        }

        return map[sum % 11]
    }
}
