# Swift Currency

[![MIT License](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/peek-travel/swift-currency/blob/master/LICENSE.txt)
![Documentation Badge](https://img.shields.io/badge/Documentation-gray?style=flat&logo=gitbook&link=https%3A%2F%2Fswiftpackageindex.com%2Fpeek-travel%2Fswift-currency%2Fmain%2Fdocumentation%2Fcurrency)

[![Swift Compatability](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fpeek-travel%2Fswift-currency%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/peek-travel/swift-currency)
[![Platform Compatability](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fpeek-travel%2Fswift-currency%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/peek-travel/swift-currency)

[![Package Tests](https://github.com/peek-travel/swift-currency/workflows/Package%20Tests/badge.svg)](https://github.com/peek-travel/swift-currency/actions?query=workflow%3A%22Package+Tests%22)
[![codecov](https://codecov.io/gh/peek-travel/swift-currency/branch/main/graph/badge.svg)](https://codecov.io/gh/peek-travel/swift-currency)

[![Maintainability](https://api.codeclimate.com/v1/badges/f17c8f5d598f61ee1a63/maintainability)](https://codeclimate.com/github/peek-travel/swift-currency/maintainability)

## Introduction

Swift Currency provides an [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) framework for representing currencies in a type-safe way in Swift.

It provides many conveniences for working with currencies, such as literal representations, value formatting, and mathematics.

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

## Language and Platform Support

This library makes a best effort to run tests everywhere it is officially possible to use this library, as defined as official language support.

However, the macOS cloud runners for GitHub Actions makes it a bit difficult to test the entire range of possibilities
as they deprecate macOS versions or don't provide installs of newer Xcode versions.

To verify if the package works as expected for your desired platform, review the latest [test results](https://github.com/peek-travel/swift-currency/actions/workflows/tests.yml).

## Installing

Add the package reference to your **Package.swift** to install via SwiftPM.

```swift
dependencies: [
    .package(url: "https://github.com/peek-travel/swift-currency", from: "0.6.0")
]
```

## Documentation

Documentation is available from the [Swift Package Index](https://swiftpackageindex.com/peek-travel/swift-currency/documentation).

## Questions

For bugs or feature requests, file a new [issue](https://github.com/peek-travel/swift-currency/issues).

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
