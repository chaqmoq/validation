import Foundation

/// An error thrown by `ConstraintValidator` for an invalid value.
public struct ConstraintViolation: LocalizedError {
    /// A custom error message.
    public let message: String

    /// See `LocalizedError`.
    public var errorDescription: String? { message }

    /// Initializes a new instance.
    ///
    /// - Parameter message: A custom error message.
    public init(_ message: String) {
        self.message = message
    }
}
