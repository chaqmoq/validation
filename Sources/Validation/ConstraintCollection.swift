public struct ConstraintCollection {
    public typealias DictionaryType = [String: [Constraint]]

    private var constraintCollection: DictionaryType

    public init() {
        constraintCollection = .init()
    }

    public init(_ constraintCollection: DictionaryType) {
        self.constraintCollection = constraintCollection
    }
}

extension ConstraintCollection {
    public subscript(key: String) -> [Constraint] {
        get { constraintCollection[key] ?? .init() }
        set { constraintCollection[key] = newValue }
    }
}

extension ConstraintCollection: Collection {
    /// See `Collection`.
    public typealias Index = DictionaryType.Index

    /// See `Collection`.
    public typealias Element = DictionaryType.Element

    /// See `Collection`.
    public var startIndex: Index { constraintCollection.startIndex }

    /// See `Collection`.
    public var endIndex: Index { constraintCollection.endIndex }

    /// See `Collection`.
    public subscript(index: Index) -> Element { constraintCollection[index] }

    /// See `Collection`.
    public func index(after index: Index) -> Index { constraintCollection.index(after: index) }
}
