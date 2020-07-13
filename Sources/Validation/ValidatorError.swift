import Foundation

public enum ValidatorError: LocalizedError {
    case invalidArgument(_ message: String?)

    public var errorDescription: String? {
        switch self {
        case .invalidArgument(let message):
            return message
        }
    }
}
