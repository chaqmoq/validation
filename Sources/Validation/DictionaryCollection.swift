/// Helps to create a custom dictionary of keys and values. E.g. `DictionaryCollection<String, Constraint>`,
/// `DictionaryCollection<String, ConstraintViolation>`, etc.
public struct DictionaryCollection<T: Hashable, V> {
    /// A typealias for the underlying storage type.
    public typealias DictionaryType = [T: [V]]

    private var collection: DictionaryType

    /// Initializes a new instance.
    public init() {
        collection = .init()
    }

    /// Initializes a new instance with another `DictionaryCollection<T, V>`.
    ///
    /// - Parameter collection: Another `DictionaryCollection<T, V>`.
    public init(_ collection: DictionaryType) {
        self.collection = collection
    }
}

extension DictionaryCollection {
    /// Gets or sets an array of `Route`s for a particular HTTP request method.
    ///
    /// - Parameter method: An HTTP request method.
    /// - Returns: An array of `Route`s for a particular HTTP request method.
    public subscript(key: T) -> [V] {
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
