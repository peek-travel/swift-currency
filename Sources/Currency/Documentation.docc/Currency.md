# ``Currency``

Interact with and calculate values of currencies in a type-safe way.

## Overview

**SwiftCurrency** aims for explicit correctness of representing currencies in their _physical_ form.

To accomplish this, currencies provide their "minorUnits" (a Base 10 "exponent" that defines the scale of their smallest currency unit). For example, the US Dollar's minorUnit is the "cent" which is 1/100 of 1 USD. So the exponent is `2`.

During initialization, the currency's value is rounded to the nearest "minorUnits" before being stored in memory as a whole number of "minorUnits".

For example, the value `USD(3.00)` is `300` "minorUnits".

If this precision is not enough, such as for representing commodities or securities, define [custom currencies](#custom-currency) to represent them.

For example, gasoline prices in USD are represented as 1/1000 of 1 Dollar, rather than 1/100. To represent gas prices, a custom type should be defined:

```swift
struct USGas: CurrencyProtocol {
  public static var name: String { return "US Gas" }
  public static var alphabeticCode: String { return "USGas" }
  public static var numericCode: UInt16 { return 8401 } // prefixed with the USD numericCode
  public static var minorUnits: UInt8 { return 3 }

  private(set) var minorUnits: Int64

  init<T: BinaryInteger>(minorUnits: T) { self.minorUnits = .init(minorUnits) }
}

let chevronPrice = USGas(3.279)
let texacoPrice = USGas(3.2689)
print (chevronPrice, texacoPrice)
// USGas(3.279), USGas(3.269)
```

## Standard Library Extensions

Where appropriate, extensions to Standard Library types are provided for common operations for better performance and correctness of behavior.

For example, `Sequence` has several overloads for calculating a sum of values:

```swift
extension Sequence where Element: AnyCurrency {
  // essentially an alias of reduce
  public func sum() -> Element

  // In place filter & reduce
  public func sum(where isIncluded: (Element) throws -> Bool) rethrows -> Element

  // In place map & reduce
  public func sum(_ transform: (Element) throws -> Element) rethrows -> Element
}
```

## API Limitations

The fundamental type of **SwiftCurrency** is the ``CurrencyProtocol``, which has `Self` requirements
that makes it impossible to use outside of generic contexts.

The ``AnyCurrency`` protocol was designed to support passing instances around as an [existential value](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html#ID275),
and is what is returned when creating an instance from a currency identifier with ``CurrencyMint``.

While this provides the ability to work outside of generic contexts,
there's no way to get into a generic context without type casting to a known concrete currency type.

This is known as "Protocol self-conformance", and is not yet supported in Swift.

For example:

```swift
struct Invoice<Currency: AnyCurrency> {
    let total: Currency
    init(_ total: Currency) { self.total = total }
}

let currency = CurrencyMint.standard.make(identifier: "USD", amount: 30.03)
let invoice = Invoice(currency)
// compile error:
// Protocol type 'AnyCurrency' cannot conform to 'AnyCurrency' because only concrete types can conform to protocols
```

Luckily, filling this gap in the language is part of the overall vision for Swift,
as described by the [Generics Manifesto](https://github.com/apple/swift/blob/master/docs/GenericsManifesto.md#existentials).

Threads discussing the progress of completing the manifesto:

- [Status of generalized existentials](https://forums.swift.org/t/status-of-generalized-existentials/13982)
- [Lifting the “Self or associated type” constraint on existentials](https://forums.swift.org/t/lifting-the-self-or-associated-type-constraint-on-existentials/18025)
- [Self-conforming protocols](https://twitter.com/Mordil/status/1227068296807059456)

## Topics

### Core API
- ``AnyCurrency``
- ``CurrencyProtocol``
- ``CurrencyMetadata``

### Creating Values

- <doc:minting_currencies>
- ``CurrencyMint``

### Working With Values

- <doc:currency_mathematics>
- <doc:displaying_currencies>

### Currency Support

- <doc:custom_currencies>

