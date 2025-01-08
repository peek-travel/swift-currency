# ``Currency/CurrencyValue``

## Overview

All `CurrencyValue` conformances are scalar values of [`Foundation.Decimal`](https://developer.apple.com/documentation/foundation/decimal)
with an associated ``CurrencyDescriptor`` that describes the semantics when using the value.

This type conforms to several Standard Library protocols for ease of use,
such as `AdditiveArithmetic`, `Hashable`, `ExpressibleByIntegerLiteral`, etc.

## Minor Units

The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) standard defines the term "minor units" to refer to currencies in
their smallest physical form. This is essentially the number of decimal places the currency uses in practice.

The associated ``CurrencyDescriptor`` provides the ISO 4217 specified "minor units" count when evaluating details
such as the ``roundedAmount`` or providing the value in terms of the ``minorUnits``.

> Example: The US Dollar uses 1/100 for its minor unit.
>
> For the value `USD(1.0)`, `minorUnits` will equal `100`.

> Important: Converting values to minor units is lossy, as the ``exactAmount`` is capable of representing fractional values.

## Equating, Hashing, and Comparing Values

In all cases both the ``exactAmount`` and ``descriptor`` type are taken into account.

If two values have different `exactAmount` or `descriptor` types, then they are not considered equal.

```swift
let usd = USD(3.14)
let otherUSD = USD(5.12)
let yen = JPY(300)

print(usd == yen) // false
print(usd == otherUSD) // false
print(usd < otherUSD) // true
```

## Creating Values with Float Literals

> Warning: Swift floating-point literals are currently initialized using binary floating-point number type,
> which cannot precisely express certain values.

To guarantee the desired `exactAmount`, initialize a `Foundation.Decimal` from a string literal instead.

```swift
let incorrectValue = USD(exactAmount: 62.12)
print(incorrectValue.exactAmount) // USD(62.11999999999998976)

let amount = Decimal(string: "62.12")!
let correctValue = USD(exactAmount: amount)
print(correctValue.exactAmount) // USD(62.12)
```


## Topics

### Initializers

- ``init(exactAmount:)``
- ``init(minorUnits:)``

### Currency Definition

- ``descriptor-40dnd``
- ``descriptor-swift.property``

### Accessing Values

- ``zero``
- ``exactAmount``
- ``minorUnits``
- ``roundedAmount``
- ``roundedAmount(using:)``
- ``negated()``

### Displaying Values

- ``localizedString(for:)``
- ``localizedString(using:)``

### Mutating Arithmetic

- ``add(_:)-7wpq3``
- ``add(_:)-9f1dj``
- ``add(_:)-3cw4x``
- ``subtract(_:)-9bwnp``
- ``subtract(_:)-6ndyb``
- ``subtract(_:)-38x86``
- ``multiply(by:)-2wpa5``
- ``multiply(by:)-3p9l0``
- ``divide(by:)-8u0um``
- ``divide(by:)-k8i6``

### Non-mutating Arithmetic

- ``adding(_:)-6gu7j``
- ``adding(_:)-1ipge``
- ``adding(_:)-7q6a2``
- ``subtracting(_:)-66neu``
- ``subtracting(_:)-w9pr``
- ``subtracting(_:)-97z2t``
- ``multiplying(by:)-7u07n``
- ``multiplying(by:)-81o21``
- ``dividing(by:)-5whpb``
- ``dividing(by:)-69hs6``
