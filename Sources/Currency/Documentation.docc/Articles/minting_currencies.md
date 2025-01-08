# Creating Currency Values at Runtime

How to create instances of a currency at runtime.

## Overview

Instances of a ``CurrencyValue`` can be created either statically by directly referencing a conforming type, (eg. `USD(3)`),
or it can be dynamically created through lookup by identifier with ``CurrencyMint``.

While the former is more straight forward, it's not always possible such as when getting monetary values from an API request
which may just contain the currency identifier and the value itself.

## Direct Creation

All ISO 4217 standard currencies have a type definition in **SwiftCurrency**, with the alphabetic identifier as the type name.

```swift
let yen = JPY.zero
let dollar = USD(1776)
let pound = GBP(3.14)
```

## By Identifier Lookup

When the currency type can't be determined until runtime, you create instances with ``CurrencyMint``.

As the vast majority of expected use of this class is with ISO 4217 standard currencies,
a singleton instance is always available from the static ``CurrencyMint/standard`` property.

```swift
let yen = CurrencyMint.standard.make(identifier: "JPY") // JPY(0)
let pounds = CurrencyMint.standard.make(identifier: 826, exactAmount: 30.23) // GBP(30.23)
let usd = CurrencyMint.standard.make(identifier: "USD", minorUnits: 300) // USD($3.00)
```
