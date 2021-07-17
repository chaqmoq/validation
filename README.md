# Validation component
[![Swift](https://img.shields.io/badge/swift-5.3-brightgreen.svg)](https://swift.org/download/#releases) [![MIT License](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://github.com/chaqmoq/validation/blob/master/LICENSE/) [![Actions Status](https://github.com/chaqmoq/validation/workflows/development/badge.svg)](https://github.com/chaqmoq/validation/actions) [![Codacy Badge](https://app.codacy.com/project/badge/Grade/42453f7665094aaaa44fc2d3836090ac)](https://www.codacy.com/gh/chaqmoq/validation?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=chaqmoq/validation&amp;utm_campaign=Badge_Grade) [![codecov](https://codecov.io/gh/chaqmoq/validation/branch/master/graph/badge.svg?token=MSOL621519)](https://codecov.io/gh/chaqmoq/validation) [![Contributing](https://img.shields.io/badge/contributing-guide-brightgreen.svg)](https://github.com/chaqmoq/validation/blob/master/CONTRIBUTING.md) [![Twitter](https://img.shields.io/badge/twitter-chaqmoqdev-brightgreen.svg)](https://twitter.com/chaqmoqdev)

## Installation
### Swift
Download and install [Swift](https://swift.org/download)

### Swift Package
```shell
mkdir MyApp
cd MyApp
swift package init --type executable // Creates an executable app named "MyApp"
```

#### Package.swift
```swift
// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "MyApp",
    dependencies: [
        .package(name: "chaqmoq-validation", url: "https://github.com/chaqmoq/validation.git", .branch("master"))
    ],
    targets: [
        .target(name: "MyApp", dependencies: [
            .product(name: "Validation", package: "chaqmoq-validation"),
        ]),
        .testTarget(name: "MyAppTests", dependencies: [
            .target(name: "MyApp")
        ])
    ]
)
```

### Build
```shell
swift build -c release
```

## Usage
```swift
import Validation

let password = "12345"
let validator = Validator()

// An array of constraints
try validator.validate(
    password,
    against: [NotBlankConstraint(), LengthConstraint(min: 6, max: 16)]
)
// A variadic list of constraints
try validator.validate(
    password,
    against: NotBlankConstraint(), LengthConstraint(min: 6, max: 16)
)
// A convenience API for the existing constraints
try validator.validate(password, against: [.notBlank(), .length(min: 6, max: 16)])

// A custom validator
struct CustomValidator: ConstraintValidator {
    func validate(_ value: String, against constraints: [Constraint]) throws {
        // A validation logic here.
    }
}

// A custom constraint
struct CustomConstraint: Constraint {
    let validator: ConstraintValidator = CustomValidator()
}

// An array of constraints
try validator.validate(
    password,
    against: [NotBlankConstraint(), LengthConstraint(min: 6, max: 16), CustomConstraint()]
)
// A variadic list of constraints
try validator.validate(
    password,
    against: NotBlankConstraint(), LengthConstraint(min: 6, max: 16), CustomConstraint()
)
```

## Tests
```shell
swift test --enable-test-discovery --sanitize=thread
```
