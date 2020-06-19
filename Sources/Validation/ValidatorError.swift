import protocol Foundation.LocalizedError

public enum ValidatorError: LocalizedError {
    case invalidArgument(message: String = "")

    public var errorDescription: String? {
        switch self {
        case .invalidArgument(let message):
            return message
        }
    }
}
