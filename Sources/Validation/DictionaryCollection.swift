public struct DictionaryCollection<T> {
    public typealias DictionaryType = [String: [T]]

    private var collection: DictionaryType

    public init() {
        collection = .init()
    }

    public init(_ collection: DictionaryType) {
        self.collection = collection
    }
}

extension DictionaryCollection {
    public subscript(key: String) -> [T] {
        get { collection[key] ?? .init() }
        set { collection[key] = newValue }
    }
}

extension DictionaryCollection: Collection {
    /// See `Collection`.
    public typealias Index = DictionaryType.Index

    /// See `Collection`.
    public typealias Element = DictionaryType.Element

    /// See `Collection`.
    public var startIndex: Index { collection.startIndex }

    /// See `Collection`.
    public var endIndex: Index { collection.endIndex }

    /// See `Collection`.
    public subscript(index: Index) -> Element { collection[index] }

    /// See `Collection`.
    public func index(after index: Index) -> Index { collection.index(after: index) }
}
