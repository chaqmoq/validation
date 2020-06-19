import protocol Foundation.LocalizedError

public struct ConstraintViolation: LocalizedError {
    public let message: String
    public var errorDescription: String? { message }

    public init(message: String) {
        self.message = message
    }
}
