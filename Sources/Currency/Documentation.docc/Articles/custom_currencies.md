# Defining Custom Currencies

How to support non-ISO standard currencies.

## Overview

While **SwiftCurrency** is primarily focused on the ISO 4217 standard for currencies - the library is capable of supporting custom (or non-ISO standard) currencies.

> Example: Some commodities are traded in values with a higher "minor unit" precision than the backing currency.
>
> Looking at gasoline prices in USD, they are represented as 1/1000 of 1 Dollar, rather than 1/100.
>
> Using the default `USD` representation would be inappropriate.

Extending **SwiftCurrency** to support additional currency types is done in two steps:

1) Define the type representing values of the currency
2) Create a custom instance of ``CurrencyMint``

## Defining the Currency

As a baseline, your type needs to conform to ``CurrencyValue``,
but it can optionally also conform to ``CurrencyDescriptor`` to avoid needing to define another type.

```swift
import Foundation

struct USGas: CurrencyValue, CurrencyDescriptor {
  public static var name: String { return "US Gas" }
  public static var alphabeticCode: String { return "USGas" }
  public static var numericCode: UInt16 { return 8401 } // prefixed with the USD numericCode
  public static var minorUnits: UInt8 { return 3 }

  let exactAmount: Decimal

  init(exactAmount: Decimal) { self.exactAmount = exactAmount }
}

let chevronPrice = USGas(3.2689)
print(chevronPrice.exactAmount) // 3.2689
print(chevronPrice.roundedAmount) // 3.269
```

### Custom Mint Instances

> Note: Custom instances of `CurrencyMint` are only necessary if you need runtime lookup of the currency.

All that is necessary for creating custom mints is to use the ``CurrencyMint/init(fallbackLookup:)`` initializer.

The closure will be queried if the requested identifier doesn't match the ISO standard definitions,
returning what was provided by the closure.

```swift
let customMint = CurrencyMint(fallbackLookup: { identifier in
  guard
    identifier == .alphaCode(USGas.alphabeticCode) || identifier == .numericCode(USGas.numericCode)
  else {
    return nil
  }

  return USGas.self
})

let chevronPrice = customMint.make(identifier: "USGas", exactAmount: 3.023)
print(type(of: chevronPrice)) // (any CurrencyValue)?
print(chevronPrice) // 3.023 USGas
```

## Topics

- ``CurrencyDescriptor``
