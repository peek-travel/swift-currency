# Minting Currency Values

How to create instances of a currency from an identifier.

## Overview

Just like a governing body, you must mint instances of values to work with them.

While this most easily can be done by using the initializers on the concrete currency type itself, there are many
situations such as from API requests, that you are given currencies in two parts: a string or numeric identifier, and a value.

To gain the type-safety that **SwiftCurrency** provides, you need a way to lookup a particular identifier and construct
the desired concrete type. This is the role of the ``CurrencyMint``.

As the vast majority of expected use of this class is with ISO 4217 standard currencies,
a singleton instance is always available from the static `standard` property.

```swift
let yen = CurrencyMint.standard.make(identifier: "JPY") // JPY(0)
let pounds = CurrencyMint.standard.make(identifier: 826, amount: 30.23) // GBP(30.23)
let usd = CurrencyMint.standard.make(identifier: "USD", minorUnits: 300) // USD($3.00)
```
