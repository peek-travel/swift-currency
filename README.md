# Swift Currency

[![MIT License](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/peek-travel/swift-currency/blob/master/LICENSE.txt)
[![Swift 5+](https://img.shields.io/badge/Swift-5.0+-orange.svg)](https://swift.org)

[![Package Tests](https://github.com/peek-travel/swift-currency/workflows/Package%20Tests/badge.svg)](https://github.com/peek-travel/swift-currency/actions?query=workflow%3A%22Package+Tests%22)
[![codecov](https://codecov.io/gh/peek-travel/swift-currency/branch/master/graph/badge.svg)](https://codecov.io/gh/peek-travel/swift-currency)

[![Documentation](https://peek-travel.github.io/swift-currency/badge.svg)](https://peek-travel.github.io/swift-currency)
[![Maintainability](https://api.codeclimate.com/v1/badges/f17c8f5d598f61ee1a63/maintainability)](https://codeclimate.com/github/peek-travel/swift-currency/maintainability)

## Introduction

Swift Currency provides type-safe representations of [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currencies in Swift.

It provides many conveniences for working with currencies, such as literal representations, string interpolation, and mathematics.

```swift
import Currency
import Foundation

let dollars = USD(30.01)
print(dollars)
// 30.01 USD
print(dollars * 2)
// 60.02 USD
print(dollars.distributedEvenly(intoParts: 6))
// [USD(1.68), USD(1.68), USD(1.68), USD(1.67), USD(1.67), USD(1.67)]

let pounds = GBP(109.23)
print(dollars + pounds)
// compile error

let jpy: JPY = 399
print("The total price is \(jpy.localizedString()).")
// "The total price is ¥399.", assuming `Foundation.Locale.current` is "en_US"

let euro = EUR(29.09)
print("Der Gesamtpreis beträgt \(localize: euro, for: .init(identifier: "de_DE")).")
// "Der Gesamtpreis beträgt 29,09 €."
```

> _For more detailed examples, see the [usage guide](./docs/Usage.md)._

## Language and Platform Test Matrix

The following table shows the combination of Swift language versions and operating systems that
receive regular unit testing.

| Platform | Swift 5 | 5.1 | 5.2 | Trunk |
|:---------|:-------:|:---:|:---:|:-----:|
| macOS Latest          | ✅ | ✅ | ✅ | |
| Ubuntu 18.04 (Bionic) | ✅ | ✅ | ✅ | ✅ |
| Ubuntu 16.04 (Xenial) | ✅ | ✅ | ✅ | ✅ |

## Installing

### Swift Package Manager

The preferred installation method is with [SPM](https://swift.org/getting-started/#using-the-package-manager). Just add the package reference to your **Package.swift**.

```swift
dependencies: [
    .package(url: "https://github.com/peek-travel/swift-currency", from: "0.6.0")
]
```

### Carthage

To install with [Carthage](https://github.com/Carthage/Carthage), just add the line `gh "https://github.com/peek-travel/swift-currency" ~> 0.6.0` to your **Cartfile**.

### Cocoapods

To install with [CocoaPods](https://cocoapods.org/), just add the line `pod 'SwiftCurrency', '~> 0.6.0'` to your **Podfile**.

## Documentation

The API docs for the latest tagged release are always available at [peek-travel.github.io/swift-currency](https://peek-travel.github.io/swift-currency).

For "how to use" guides, and additional information about the project, [see the documentation](./docs).

## Questions

For bugs or feature requests, file a new [issue](https://gitlab.com/mordil/swift-redi-stack/issues).

## Changelog

[SemVer](https://semver.org/) changes are documented for each release on the [releases page](https://github.com/peek-travel/swift-currency/releases).

## Contributing

Check out [CONTRIBUTING.md](https://github.com/peek-travel/swift-currency/blob/master/CONTRIBUTING.md) for more information on how to help with **SwiftCurrency**.

## Contributors

Check out [CONTRIBUTORS.txt](https://github.com/peek-travel/swift-currency/blob/master/CONTRIBUTORS.txt) to see the full list. This list is updated for each release.

## License

[MIT](https://github.com/peek-travel/swift-currency/blob/master/LICENSE.txt)

Copyright (c) 2020-present, Peek Travel Inc.

_This project contains code written by others not affliated with this project. All copyright claims are reserved by them. For a full list, with their claimed rights, see [NOTICE.txt](https://github.com/peek-travel/swift-currency/blob/master/NOTICE.txt)_

_**Swift** is a registered trademark of **Apple, Inc**. Any use of their trademark does not imply any affiliation with or endorsement by them, and all rights are reserved by them._
