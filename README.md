# Validation component
[![Swift](https://img.shields.io/badge/swift-5.1-brightgreen.svg)](https://swift.org/download/#releases) [![MIT License](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://github.com/chaqmoq/validation/blob/master/LICENSE/) [![Actions Status](https://github.com/chaqmoq/validation/workflows/development/badge.svg)](https://github.com/chaqmoq/validation/actions) [![codecov](https://codecov.io/gh/chaqmoq/validation/branch/master/graph/badge.svg)](https://codecov.io/gh/chaqmoq/validation)

## Installation

### Package.swift
```swift
let package = Package(
    // ...
    dependencies: [
        // Other packages...
        .package(url: "https://github.com/chaqmoq/validation.git", .branch("master"))
    ],
    targets: [
        // Other targets...
        .target(name: "...", dependencies: ["Validation"])
    ]
)
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change. Please, make sure to update tests as appropriate.

## License
[MIT](https://github.com/chaqmoq/validation/blob/master/LICENSE)
