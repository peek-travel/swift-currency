# Using SwiftCurrency

## Table of Contents

- [Overview](#overview)
  - [Currency Protocols](#currency-protocols)
  - [Mathematics](#mathematics)
    - [Rounding Behavior](#rounding-behavior)
    - [Advanced Algorithms](#advanced-algorithms)
    - [Standard Library Extensions](#standard-library-extensions)
  - [API Limitations](#api-limitations)
- [Identifier Lookup](#identifier-lookup)
  - [Default Currency](#default-currency)
- [Custom Currencies](#custom-currencies)
- [Displaying Currency Values](#displaying-currency-values)

## Overview
[[Back to Top]](#table-of-contents)

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

### Currency Protocols
[[Back to Top]](#table-of-contents)

**SwiftCurrency** provides two protocols for working with currencies:

1. [`AnyCurrency`][AnyCurrency]
    -  The basic representation of a currency, which can be used as an [existential value][Existentials] of a `CurrencyProtocol` instance that can be passed around in place of a concrete type such as `USD`
    - [There are limitations to using this protocol this way](#api-limitations)
1. [`CurrencyProtocol`][CurrencyProtocol]
    - Refines `AnyCurrency`, but with `Self` requirements as it also refines Standard Library protocols
such as [`Comparable`](https://developer.apple.com/documentation/swift/comparable) and [`Hashable`](https://developer.apple.com/documentation/swift/hashable)

Guidelines for when to use `AnyCurrency` vs `CurrencyProtocol`:

1. When creating a [custom currency](#custom-currencies), conform to `CurrencyProtocol`.
1. If you need to extend _any_ currency type - use `AnyCurrency`.
1. If you are extending types with associated types that are a Currency, such as `Array` or `Set`, use `AnyCurrency`.
1. If your generic type constraints aren't strict enough, such as needing `Hashable` conformance for [`Set`](https://developer.apple.com/documentation/swift/set) - use `CurrencyProtocol`.

For example:

```swift
// good use of CurrencyProtocol
class ATM<Currency: CurrencyProtocol> {
  static let denominations: Set<Currency> = {
    /* some implementation */
  }
  
  let cashAvailable: [Currency]
}
struct CustomCurrency: CurrencyProtocol {
  static var metadata: CurrencyMetadata.Type { return /* some metadata type */ }
  private(set) var minorUnits: Int64
  init<T: BinaryInteger>(minorUnits: T) { self.minorUnits = .init(minorUnits) }
}

// good use of AnyCurrency
extension Set where Element: AnyCurrency {
  /// Returns the sum total of all amounts in the sequence.
  public func sum() -> Element {
    return self.reduce(into: .zero, +=)
  }
}
extension AnyCurrency {
  func split(intoParts: Int) { /* implementation */ }
}
```

### Mathematics
[[Back to Top]](#table-of-contents)

Basic arithmetic is supported with currencies, in both the normal form and `inout` (eg. `*` vs `*=`).

In addition, there is the [`negated()`](https://peek-travel.github.io/swift-currency/Protocols/AnyCurrency.html#/s:8Currency03AnyA0PAAE7negatedxyF) method for safely reversing the sign of a currency value.

#### Rounding Behavior
[[Back to Top]](#table-of-contents)

In all cases of rounding, the [`Foundation.Decimal.RoundingMode.Bankers`](https://developer.apple.com/documentation/foundation/decimal/roundingmode/bankers) / [`FloatingPointRoundingRule.toNearestOrEven`](https://developer.apple.com/documentation/swift/floatingpointroundingrule/tonearestoreven) behavior is used.

#### Advanced Algorithms
[[Back to Top]](#table-of-contents)

Much like the Swift Evolution guidelines for when something should be added to the language or Standard Library,
**SwiftCurrency** will provide "advanced" algorithms where writing code for working with currencies is difficult or error-prone.

For example, an app may support splitting a bill's total at a restaurant evenly between all the table's patrons.

While writing an implementation is easy in theory, but "minorUnits" (eg. US cents) can be lost as remainders in plain arithmetic, known as [penny shaving](https://en.wikipedia.org/wiki/Salami_slicing).

```swift
// naïve implementation

let total = USD(15.01)
let numPatrons = 3
let individualTotal = total.amount / numPatrons
let splitValues: [USD] = .init(repeating: .init(amount: individualTotal), count: numPatrons)
print(splitValues)
// [USD(5.00), USD(5.00), USD(5.00)] - $0.01 is missing!
```

To protect developers from this common mistake, the [`distributedEvenly(intoParts:)`](https://peek-travel.github.io/swift-currency/Protocols/AnyCurrency.html#/s:8Currency03AnyA0PAAE17distributedEvenly9intoPartsSayxGSi_tF) method is available:

```swift
let total = USD(15.01)
let splitValues = total.distributedEvenly(intoParts: 3)
print(splitValues)
// [USD(5.01), USD(5.00), USD(5.00)] - no remainder
```

#### Standard Library Extensions
[[Back to Top]](#table-of-contents)

Where appropriate, extensions to Standard Library types are provided for common operations for better performance and correctness of behavior.

For example, [`Sequence` has several overloads for calculating a sum of values](https://peek-travel.github.io/swift-currency/Extensions/Sequence.html):

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

### API Limitations
[[Back to Top]](#table-of-contents)

The fundamental type of **SwiftCurrency** is the [`CurrencyProtocol`][CurrencyProtocol], which has `Self` requirements that makes it impossible to use outside of generic contexts.

The [`AnyCurrency`][AnyCurrency] protocol was designed to support passing instances around as an [existential value][Existentials], and is what is returned when creating an instance from a currency identifier with [`CurrencyMint`][CurrencyMint].

While this provides the ability to work outside of generic contexts, there's no way to get into a generic context without type casting to a known concrete currency type. This is known as "Protocol self-conformance", and is not yet supported in Swift.

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

Luckily, filling this gap in the language is part of the overall vision for Swift, as described by the [Generics Manifesto](https://github.com/apple/swift/blob/master/docs/GenericsManifesto.md#existentials).

Threads discussing the progress of completing the manifesto:

- [Status of generalized existentials](https://forums.swift.org/t/status-of-generalized-existentials/13982)
- [Lifting the “Self or associated type” constraint on existentials](https://forums.swift.org/t/lifting-the-self-or-associated-type-constraint-on-existentials/18025)
- [Self-conforming protocols](https://twitter.com/Mordil/status/1227068296807059456)

## Identifier Lookup
[[Back to Top]](#table-of-contents)

There are many situations, such as from API requests, that you are given currencies in two parts: a string or numeric identifier, and a value.

To gain the type-safety that **SwiftCurrency** provides, you need a way to lookup a particular identifier and construct the desired concrete type. This is the role of the [`CurrencyMint`][CurrencyMint].

As the vast majority of expected use of this class is with ISO 4217 standard currencies, a singleton instance is always available from the static `standard` property.

```swift
let yen = CurrencyMint.standard.make(identifier: "JPY") // JPY(0)
let pounds = CurrencyMint.standard.make(identifier: 826, amount: 30.23) // GBP(30.23)
let usd = CurrencyMint.standard.make(identifier: "USD", minorUnits: 300) // USD($3.00)
```

> _Since currency values are stored in their "minor units", usually known as the smallest value of coinage, it made sense to use the term [**mint** in the type's name, after the facilities responsible for manufacturing a currency's coins](https://en.wikipedia.org/wiki/Mint_(facility))._

### Default Currency

By default, if an identifier is not matched to a defined currency type - then the returned value from all [`make(identifier:)`](https://peek-travel.github.io/swift-currency/Classes/CurrencyMint.html#/Factory%20Methods) calls are `nil`.

However, if you have a reasonable default currency to work with in your application, you can change the behavior to always return instances of said currency if a match is not found.

This is done by creating an instance with the [`init(defaultCurrency:)`](https://peek-travel.github.io/swift-currency/Classes/CurrencyMint.html#/s:8Currency0A4MintC07defaultA0ACxm_tcAA0A8ProtocolRzlufc) initializer:

```swift
let mint = CurrencyMint(defaultCurrency: USD.self)
let value = mint.make(identifier: "some fake value", amount: 300)
print(value is USD) // true
print(value as? USD) // Optional<USD(3.00)>
```

## Custom Currencies
[[Back to Top]](#table-of-contents)

While **SwiftCurrency** is primarily focused on the ISO 4217 standard for currencies - the library is capable of supporting custom (or missing ISO standard) currencies.

There are cases where custom currencies need to be supported, such as by mobile game developers who have an in-game currency that still has the same semantics of real currencies.

Extending **SwiftCurrency** to support additional currency types is done in two steps:

1) Define a type that conforms to [`CurrencyProtocol`][CurrencyProtocol]
    - A barebones implementation could copy any of the [ISO 4217 currency implementations](https://peek-travel.github.io/swift-currency/Structs.html#/ISO%204217%20Currencies)
2) Create a custom instance of [`CurrencyMint`][CurrencyMint] with the [`init(fallbackLookup:)`](https://peek-travel.github.io/swift-currency/Classes/CurrencyMint.html#/s:8Currency0A4MintC14fallbackLookupAcA03AnyA0_pXpSgAC0A10IdentifierOc_tcfc) initializer.
    - This is only necessary if you need to lookup the custom type from an identifier

```swift
struct KED: CurrencyProtocol, CurrencyMetadata {
  static var name: String { return "Klingon Empire Darsek" }
  static var alphabeticCode: String { return "KED" }
  static var numericCode: UInt16 { return 2151 }
  static var minorUnits: UInt8 { return 3 }

  let minorUnits: Int64

  init<T: BinaryInteger>(minorUnits: T) { self.minorUnits = .init(minorUnits) }
}

let customMint = CurrencyMint(fallbackLookup: { identifier in
  guard identifier == .alphaCode(KED.alphabeticCode) || identifier == .numericCode(KED.numericCode) else {
    return nil
  }
  return KED.self
})
let darseks = customMint.make(identifier: "KED", amount: 312023)
print(darseks is KED) // true
print(darseks as? KED) // Optional<KED(312.023)>
```

## Displaying Currency Values
[[Back to Top]](#table-of-contents)

While type-safety is important, as well as mathematic accuracy, it is extremely common to have a need of displaying currency values to end users.

As most developers are familiar with, localization is not just about translation. You also need to account for
languages that read from right to left, differences in colors between cultures, and the formatting of numbers.

So, while [`AnyCurrency`][AnyCurrency] conforms to [`CustomStringConvertible`][CustomStringConvertible], the `description` property is not appropriate in most cases for displaying values to end users.

For displaying values to an end user, the `localizedString(for:nilDescription:)` or `localizedString(using:nilDescription:)` methods are available.

Both of these methods are also available when doing [string interpolation](https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html#ID292).

```swift
// assuming `Foundation.Locale.current` is "en_US"

let price = EUR(2_103.95)
print("Total: \(price.localizedString())") // or \(localize: price)
// €2,103.95

let locale = Locale(identifier: "de_DE")

print("Gesamtpreis: \(price.localizedString(for: locale))") // or \(localize: price, for: locale)
// Gesamtpreis: 2.103,95 €

let formatter = NumberFormatter()
formatter.numberStyle = .currency
formatter.locale = locale
formatter.currencyCode = EUR.alphabeticCode
formatter.currencyGroupingSeparator = "_"
formatter.currencyDecimalSeparator = "."

print("Gesamtpreis: \(price.localizedString(using: formatter))") // or \(localize: price, with: formatter)
// Gesamtpreis: 2_103.95 €
```




[AnyCurrency]: https://peek-travel.github.io/swift-currency/Protocols/AnyCurrency.html "AnyCurrency API Documentation"
[CurrencyMint]: https://peek-travel.github.io/swift-currency/Classes/CurrencyMint.html "CurrencyMint API Documentation"
[CurrencyProtocol]: https://peek-travel.github.io/swift-currency/Protocols/CurrencyProtocol.html "CurrencyProtocol API Documentation"
[CustomStringConvertible]: https://developer.apple.com/documentation/swift/customstringconvertible "CustomStringConvertible API Documentation"
[Existentials]: https://stackoverflow.com/questions/56867602/what-does-existential-type-mean-in-swift "Definition of Existentials in Swift"
