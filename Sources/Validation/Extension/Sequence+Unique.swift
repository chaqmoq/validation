extension Sequence where Iterator.Element: Hashable {
    var unique: [Iterator.Element] {
        var seen = Set<Iterator.Element>()
        return filter { seen.insert($0).inserted }
    }
}
