# Swift Currency

[![codecov](https://codecov.io/gh/peek-travel/swift-currency/branch/master/graph/badge.svg)](https://codecov.io/gh/peek-travel/swift-currency)
[![Package Tests](https://github.com/peek-travel/swift-currency/workflows/Package%20Tests/badge.svg)](https://github.com/peek-travel/swift-currency/actions?query=workflow%3A%22Package+Tests%22)
[![MIT License](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/peek-travel/swift-currency/blob/master/LICENSE.txt)
[![Swift 5+](https://img.shields.io/badge/Swift-5.0+-orange.svg)](https://swift.org)

## Introduction

Swift Currency provides type-safe representations of [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currencies in Swift.

It provides many conveniences for working with currencies, such as literal representations, string interpolation, and algorithms.

```swift
import Currency
import Foundation

let usd = USD(30.01)
print(usd) // $30.01 if locale is en_US
print(usd.distributedEvenly(intoParts: 6))
// [USD(1.68), USD(1.68), USD(1.68), USD(1.67), USD(1.67), USD(1.67)]

let gbp = GBP(109.23)
print(usd + gbp) // compile error

let jpy: JPY = 399 // JPY(399)
print("The total cost is \(localize: JPY, forLocale: .init(identifier: "fr_FR")).)
// "The total cost is 399 JPY."
```

## Language and Platform Test Matrix

The following table shows the combination of Swift language versions and operating systems that
receive regular unit testing.

| Platform | Swift 5 | 5.1 | 5.2 | Trunk |
|:---------|:-------:|:---:|:---:|:-----:|
| macOS Latest | :white_check_mark: | :white_check_mark: | | |
| Ubuntu 18.04 (Bionic) | | | | |
| Ubuntu 16.04 (Xenial) | | | | |

## Installing

### Swift Package Manager

The preferred installation method is with [SPM](https://swift.org/getting-started/#using-the-package-manager). Just add the package reference to your **Package.swift**.

```swift
dependencies: [
    .package(url: "https://github.com/peek-travel/swift-currency", from: "1.0.0")
]
```

### Carthage

To install with [Carthage](https://github.com/Carthage/Carthage), just add the line `gh "https://github.com/peek-travel/swift-currency" ~> 1.0.0` to your **Cartfile**.

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
