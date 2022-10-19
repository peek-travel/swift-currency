# Currency Math

Understanding basic and advanced monetary mathematics.

## Overview

Basic arithmetic is supported with currencies, in both the normal form and `inout` (eg. `*` vs `*=`).

In addition, there is the ``AnyCurrency/negated()`` method for safely reversing the sign of a currency value.

## Rounding Behavior

In all cases of rounding, the [`Foundation.Decimal.RoundingMode.Bankers`](https://developer.apple.com/documentation/foundation/decimal/roundingmode/bankers) / [`FloatingPointRoundingRule.toNearestOrEven`](https://developer.apple.com/documentation/swift/floatingpointroundingrule/tonearestoreven) behavior is used.

## Advanced Algorithms

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

To protect developers from this common mistake, the ``AnyCurrency/distributedEvenly(intoParts:)`` method is available:

```swift
let total = USD(15.01)
let splitValues = total.distributedEvenly(intoParts: 3)
print(splitValues)
// [USD(5.01), USD(5.00), USD(5.00)] - no remainder
```

## Topics

### Advanced Algorithms

- ``AnyCurrency/distributedEvenly(intoParts:)``
- ``AnyCurrency/distributedProportionally(between:)``
