import Foundation

extension Validator {
    /// A common error type thrown when an invalid `Constraint` type is provided to the `validate(_:against:)` method of the
    /// `ConstraintValidator`.
    public enum Error: LocalizedError {
        /// An error type for an invalid argument.
        ///
        /// - Parameter message: A custom error message. Defaults to `nil`.
        case invalidArgument(_ message: String? = nil)

        /// See `LocalizedError`.
        public var errorDescription: String? {
            switch self {
            case let .invalidArgument(message): return message
            }
        }
    }
}
