// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "chaqmoq-validation",
    products: [
        .library(name: "Validation", targets: ["Validation"])
    ],
    targets: [
        .target(name: "Validation"),
        .testTarget(name: "ValidationTests", dependencies: [
            .target(name: "Validation")
        ])
    ],
    swiftLanguageVersions: [.v5]
)
