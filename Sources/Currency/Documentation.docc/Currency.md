# ``Currency``

Interact with, and calculate values of, currencies in a type-safe, ISO 4217 compliant way.

## Overview

**SwiftCurrency** provides all of the necessary details to work with any currency in terms of
the [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) standard.

It also automatically provides definitions for any currency defined in the ISO 4217 standard.

For other common but not standard-defined currencies,
such as "US Gas" which uses 3 decimal points, see <doc:custom_currencies>.

The core aim of the module is absolute correctness in storing, calculating,
and representing currencies within their local context.

No currency conversions (exchanges) are possible.

## Core Concepts

Decimal-based currencies all choose a set number of "places" that the decimal point is significant for
representing the currency in physical form: it's smallest unit of measurement.

This number is extremely important for rounding and other algorithms.

In ISO 4217 terms, this is referred to as the currency's "minor units".

> Example: The value `USD(3.00)` is `300` "minor units", as USD uses the Penny as the smallest unit at 1/100th.
>
> However, Japenese Yen (JPY) has a "minor unit" of 0, as their smallest unit is the Yen itself.

## Standard Library Extensions

Where appropriate, extensions to Standard Library types are provided for common operations for better performance and correctness of behavior.

For example, `Sequence` has several overloads for calculating a sum of values:

```swift
extension Sequence where Element: CurrencyValue {
  // essentially an alias of reduce
  public func sum() -> Element

  // In place filter & reduce
  public func sum(where isIncluded: (Element) throws -> Bool) rethrows -> Element

  // In place map & reduce
  public func sum(_ transform: (Element) throws -> Element) rethrows -> Element
}
```

## Language Limitations

When dealing with concrete ``CurrencyValue`` types, such as `USD`, anything you can
imagine with the type should work as expected.

However, if you are working with contexts of `any CurrencyValue` ([existential values](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/protocols/#Protocols-as-Types)),
some of the API may not be available or work as expected.

For example, operators are unable to resolve which implementation is to be used due to the type-erased `Self`.

In that situation, instance methods are available to still provide the same functionality.

However, you are still able to pass an `any CurrencyValue` to a context expecting `some CurrencyValue`.

```swift
struct Invoice<Currency: CurrencyValue> {
    let total: Currency
    init(_ total: Currency) { self.total = total }
}

let currency = CurrencyMint.standard.make(identifier: "USD", exactAmount: 30.03)
let invoice = Invoice(currency)
// type(of: invoice) == Invoice<any CurrencyValue>

print(invoice.total)
// USD(30.03)
```

## Topics

- <doc:minting_currencies>
- <doc:custom_currencies>
- ``CurrencyValue``
- ``CurrencyMint``

### Working With Values

- <doc:currency_mathematics>
- <doc:displaying_currencies>
