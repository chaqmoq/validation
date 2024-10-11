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
            case let .invalidArgument(message): message
            }
        }
    }
}

extension Validator.Error {
    enum Message {
        case constraintType(Constraint.Type)
        case integerRange(Int, Int)
        case integerType
        case lengthRange(UInt, UInt)
        case primitiveValue

        var text: String {
            switch self {
            case .constraintType(let type): "The constraint must be of \(String(describing: type)) type."
            case .integerRange(let min, let max):
                "The minimum value of \(min) must be less than or equal to maximum value of \(max)."
            case .integerType: "The value must be an integer."
            case .lengthRange(let min, let max):
                "The minimum value of \(min) must be less than or equal to maximum value of \(max)."
            case .primitiveValue: "The value must be of primitive type."
            }
        }
    }
}
