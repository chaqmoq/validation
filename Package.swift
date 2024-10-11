// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "chaqmoq-validation",
    products: [
        .library(name: "Validation", targets: ["Validation"])
    ],
    dependencies: [
        .package(url: "https://github.com/marmelroy/PhoneNumberKit.git", from: "4.0.0")
    ],
    targets: [
        .target(name: "Validation", dependencies: [
            .product(name: "PhoneNumberKit", package: "PhoneNumberKit"),
        ]),
        .testTarget(name: "ValidationTests", dependencies: [
            .target(name: "Validation")
        ])
    ],
    swiftLanguageVersions: [.v5]
)
