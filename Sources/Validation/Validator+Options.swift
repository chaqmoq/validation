extension Validator {
    /// A list of `OptionSet` to manage the behavior of `Validator`.
    public struct Options: OptionSet {
        /// Validates non-existing keys in a dictionary or `Encodable` data.
        public static let strict = Options(rawValue: 1 << 0)

        /// See `OptionSet`.
        public let rawValue: Int8

        /// See `OptionSet`.
        public init(rawValue: Int8) {
            self.rawValue = rawValue
        }
    }
}
