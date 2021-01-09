import Foundation

/// A common error type to throw by `ConstraintValidator` for an invalid value.
public struct ConstraintViolation: LocalizedError {
    /// A custom error message.
    public let message: String

    /// See `LocalizedError`.
    public var errorDescription: String? { message }

    /// Initializes a new instance with a custom error message.
    ///
    /// - Parameter message: A custom error message.
    public init(_ message: String) {
        self.message = message
    }
}
