// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "chaqmoq-validation",
    products: [
        .library(name: "Validation", targets: ["Validation"])
    ],
    dependencies: [
        .package(url: "https://github.com/marmelroy/PhoneNumberKit.git", from: "3.2.0")
    ],
    targets: [
        .target(name: "Validation", dependencies: ["PhoneNumberKit"]),
        .testTarget(name: "ValidationTests", dependencies: ["Validation"])
    ],
    swiftLanguageVersions: [.v5]
)
