# Currency Math

Understanding basic and advanced monetary mathematics.

## Overview

Basic arithmetic is supported with currencies, in both the normal form and `inout` (eg. `*` vs `*=`).

In addition, there is the ``CurrencyValue/negated()`` method for safely reversing the sign of a currency value.

When dealing with `any CurrencyValue` instances, methods are provided to use instead of direct operators.

Mutating methods are directive verbs such as `add`, while non-mutating methods are imperative verbs such as `adding`.

## Rounding Behavior

When accessing the ``CurrencyValue/roundedAmount`` property, the ``CurrencyValue/exactAmount`` is rounded using
the [`Foundation.Decimal.RoundingMode.Bankers`](https://developer.apple.com/documentation/foundation/decimal/roundingmode/bankers) behavior.

If you want explicit control of the behavior, use the ``CurrencyValue/roundedAmount(using:)`` method.

## Advanced Algorithms

Much like the Swift Evolution guidelines for when something should be added to the language or Standard Library,
**SwiftCurrency** will provide "advanced" algorithms where writing code for working with currencies is difficult or error-prone.

For example, an app may support splitting a bill's total at a restaurant evenly between all the table's patrons.

While writing an implementation is easy in theory, in practice "minor units" can be lost as remainders in plain arithmetic, known as [penny, or salami, shaving](https://en.wikipedia.org/wiki/Salami_slicing).

```swift
// naïve implementation

let total = USD(15.01)
let numPatrons = 3
let individualTotal = total.exactAmount / Decimal(numPatrons)
let splitValues: [USD] = .init(
    repeating: .init(exactAmount: individualTotal),
    count: numPatrons
)

print(splitValues)
// [USD(5.00), USD(5.00), USD(5.00)] - $0.01 is missing!
```

To protect developers from this common mistake, the ``CurrencyValue/distributedEvenly(intoParts:)`` method is available:

```swift
let total = USD(15.01)
let splitValues = total.distributedEvenly(intoParts: 3)

print(splitValues)
// [USD(5.01), USD(5.00), USD(5.00)] - no remainder
```

## Topics

### Basic Arithmetic

See the definitions on the protocol itself.

- ``CurrencyValue``

### Sequence Arithmetic

- ``Swift/Sequence/sum()``
- ``Swift/Sequence/sum(_:)``
- ``Swift/Sequence/sum(where:)``

### Advanced Algorithms

- ``CurrencyValue/distributedEvenly(intoParts:)``
