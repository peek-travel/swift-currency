# ``Currency/CurrencyMint``

## Overview

By default, the generator only references the [ISO 4217](https://www.iso.org/iso-4217-currency-codes.html) specification
of identifiers to determine which currency type to create.

```swift
let usd = CurrencyMint.standard.make(identifier: "USD", exactAmount: 30.23)
print(usd)
// USD(30.23)
```

> Note: _Since the entire purpose of this type is creating currency values at runtime, it made sense to use the term [**mint** in the type's name, after the facilities responsible for manufacturing a currency's coins](https://en.wikipedia.org/wiki/Mint_(facility))._

## Fallback Currencies

In some cases, it's desired to just provide a single fallback currency when type lookup fails:

```swift
let mint = CurrencyMint(defaultCurrency: USD.self)
let value = mint.make(identifier: "_SL", exactAmount: 300)
print(value)
// USD(300)
```

## Topics

### Creating a Mint

- ``CurrencyMint/standard``
- ``CurrencyMint/init(defaultCurrency:)``

### Minting Currency Values

- ``CurrencyMint/CurrencyIdentifier``
- ``make(identifier:exactAmount:)``
- ``make(identifier:minorUnits:)``

### Customizing Mint Behavior

- ``CurrencyMint/IdentifierLookup``
- ``CurrencyMint/init(fallbackLookup:)``
