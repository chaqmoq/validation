import Foundation

extension Validator {
    /// A common error type to throw when an invalid `Constraint` is provided to a `ConstraintValidator`.
    public enum Error: LocalizedError {
        /// An error type for an invalid argument.
        ///
        /// - Parameter message: A custom error message. Defaults to `nil`.
        case invalidArgument(_ message: String? = nil)

        /// See `LocalizedError`.
        public var errorDescription: String? {
            switch self {
            case .invalidArgument(let message): return message
            }
        }
    }
}
