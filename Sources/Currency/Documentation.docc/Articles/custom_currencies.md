# Supporting Custom Currencies

How to support non-ISO standard currencies.

## Overview

While **SwiftCurrency** is primarily focused on the ISO 4217 standard for currencies - the library is capable of supporting custom (or non-ISO standard) currencies.

There are cases where custom currencies need to be supported, such as by mobile game developers who have an in-game currency that still has the same semantics of real currencies.

Extending **SwiftCurrency** to support additional currency types is done in two steps:

1) Define a type that conforms to ``CurrencyProtocol``
2) Create a custom instance of ``CurrencyMint`` with the ``CurrencyMint/init(fallbackLookup:)`` initializer.

> Tip: This is only necessary if you need to lookup the custom type from an identifier

### Example
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

## Understanding the Core API

**SwiftCurrency** provides two protocols for working with currencies:

1. ``AnyCurrency``
    -  The basic representation of a currency, which can be used as an [existential value](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html#ID275) of a ``CurrencyProtocol`` instance that can be passed around in place of a concrete type such as ``USD``
1. ``CurrencyProtocol``
    - Refines `AnyCurrency`, but with `Self` requirements as it also refines Standard Library protocols such as [`Comparable`](https://developer.apple.com/documentation/swift/comparable) and [`Hashable`](https://developer.apple.com/documentation/swift/hashable)

Guidelines for when to use `AnyCurrency` vs `CurrencyProtocol`:

1. When creating a custom currency, conform to `CurrencyProtocol`.
1. If you need to extend _any_ currency type - use `AnyCurrency`.
1. If you are extending types with associated types that are a Currency, such as `Array` or `Set`, use `AnyCurrency`.
1. If your generic type constraints aren't strict enough, such as needing `Hashable` conformance for `Set` - use `CurrencyProtocol`.

### Example

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

## Topics

### Defining Custom Currencies

- ``AnyCurrency``
- ``CurrencyProtocol``
- ``CurrencyMetadata``
- ``CurrencyProtocol``
