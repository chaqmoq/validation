import Foundation

extension DateFormatter {
    public static var iso8601: Self {
        let dateFormatter = Self()
        dateFormatter.locale = .init(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        return dateFormatter
    }
}
