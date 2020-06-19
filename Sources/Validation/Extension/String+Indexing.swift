extension String {
    subscript (index: Int) -> Character {
        return self[self.index(startIndex, offsetBy: index)]
    }

    func firstIntIndex(of character: Character) -> Int? {
        if let index = firstIndex(of: character) {
            return distance(from: startIndex, to: index)
        }

        return nil
    }
}
