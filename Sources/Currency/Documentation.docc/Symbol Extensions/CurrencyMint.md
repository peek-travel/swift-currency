# ``Currency/CurrencyMint``

## Overview

By default, the generator only references the [ISO 4217](https://www.iso.org/iso-4217-currency-codes.html)) specification
of identifiers to determine which currency type to create.

```swift
let usd = CurrencyMint.standard.make(identifier: "USD", amount: 30.23)
print(usd)
// USD(30.23)
```

### Custom Currencies

If it's desired to support currencies not found in the supported ISO 4217 specification,
a closure that will be referenced as a fallback can be provided at initialization:

```swift
let mint = CurrencyMint(fallbackLookup: { identifier in
  guard identifier == .alphaCode("KED") else {
    return USD.self // or nil
  }
  
  return KED.self // the custom currency type
}
let ked = mint.make(identifier: "KED")
let unknownCurrency = mint.make(identifier: 666)
print(ked, unknownCurrency)
// KED(0), USD(0)
```

### Fallback Currencies

In most cases, it's desired to just provide a single fallback currency when type lookup fails:

```swift
let mint = CurrencyMint(defaultCurrency: USD.self)
let value = mint.make(identifier: "_SL", amount: 300)
print(value)
// USD(300)
```

> _Since currency values are stored in their "minor units", usually known as the smallest value of coinage, it made sense to use the term [**mint** in the type's name, after the facilities responsible for manufacturing a currency's coins](https://en.wikipedia.org/wiki/Mint_(facility))._

## Topics

### Creating a Mint

- ``CurrencyMint/standard``
- ``CurrencyMint/init(defaultCurrency:)``

### Minting Currency Values

- ``CurrencyMint/CurrencyIdentifier``
- ``make(identifier:amount:)``
- ``make(identifier:minorUnits:)``

### Customizing Mint Behavior

- ``CurrencyMint/IdentifierLookup``
- ``CurrencyMint/init(fallbackLookup:)``

### Custom Currency Support

- <doc:custom_currencies>
