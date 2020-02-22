//===----------------------------------------------------------------------===//
//
// This source file is part of the SwiftCurrency open source project
//
// Copyright (c) 2020 SwiftCurrency project authors
// Licensed under MIT License
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of SwiftCurrency project authors
//
// SPDX-License-Identifier: MIT
//
//===----------------------------------------------------------------------===//

import Foundation

/// A representation of a value in a specific currency that can be used as an existential.
///
/// In most cases, it's preferable to work with currencies in their `CurrencyProtocol` generic form.
///
/// **Value Representation**
///
/// All currencies have a "minorUnits" scale, as defined by their `CurrencyMetadata` that determine their precision when represented as a `Foundation.Decimal`.
///
/// For example, as the USD uses 1/100 for its minor unit, with the value `USD(1.0)`, `minorUnits` will be the value `100`.
///
/// _Equality comparisons and most arithmetic operations use this value._
///
/// **Floating Point Initialization**
///
/// All floating point type values provided to initializers will be "bankers" rounded to their `CurrencyMetadata.minorUnits` scale before being stored in memory.
public protocol AnyCurrency:
  CustomStringConvertible, CustomDebugStringConvertible, CustomPlaygroundDisplayConvertible
{
  /// The ISO 4217 information about this currency.
  static var metadata: CurrencyMetadata.Type { get }

  /// The amount represented as a whole number of the currency's "minorUnits".
  /// See `CurrencyMetadata.minorUnits` and `Foundation.RoundingMode.bankers`.
  var minorUnits: Int64 { get }

  /// The `bankers` rounded amount of money being represented, as defined by the currency.
  ///
  /// For example:
  ///
  ///     let usd = USD(10.007)
  ///     let yen = JPY(100.9)
  ///     let dinar = KWD(100.0019)
  ///     print(usd, yen, dinar)
  ///     // "USD(10.01), JPY(101), KWD(100.002)
  ///
  /// See `CurrencyMetadata.minorUnits` and `Foundation.RoundingMode.bankers`.
  var amount: Decimal { get }

  /// Creates a representation of the provided amount as the currency's exact smallest unit.
  ///
  /// For example, the USD has cents, which are 1/100 of 1 USD. Calling `USD(minorUnits: 100)` will create a value of `1.0`.
  ///
  /// See `CurrencyMetadata.minorUnits`.
  /// - Parameter minorUnits: The exact amount of the smallest units in the currency to represent.
  init<T: BinaryInteger>(minorUnits: T)

  /// Creates a representation of the provided amount in the desired currency, if it can be represented.
  ///
  /// The value will be "bankers" rounded, to the precision as defined by the currency's "minorUnits" metadata.
  ///
  /// See `CurrencyMetadata.minorUnits` and `Foundation.Decimal.RoundingMode.bankers`.
  /// - Parameter amount: The amount this instance should represent, after "bankers" rounding. If this value is `NaN`, then initialization will fail.
  init?(amount: Decimal)
}

// MARK: Helpers

extension AnyCurrency {
  internal init(scalingAndRounding value: Decimal) {
    let result = value.roundedAndScaled(to: Self.metadata.minorUnits)
    self.init(minorUnits: result.int64Value)
  }
}

// MARK: Default Implementations

extension AnyCurrency {
  public var amount: Decimal {
    return Decimal(minorUnits).scaled(to: .init(Self.metadata.minorUnits), inverse: true)
  }

  public init?(amount: Decimal) {
    switch amount {
    case .nan, .quietNaN: return nil
    default: self.init(scalingAndRounding: amount)
    }
  }

  public static func ==(lhs: Self, rhs: Self) -> Bool {
    return lhs.minorUnits == rhs.minorUnits
  }

  public static func <(lhs: Self, rhs: Self) -> Bool {
    return lhs.minorUnits < rhs.minorUnits
  }

  public func hash(into hasher: inout Hasher) {
    hasher.combine(self.minorUnits)
  }
}

extension AnyCurrency where Self: CurrencyMetadata {
  public static var metadata: CurrencyMetadata.Type { return Self.self }
}

// MARK: Arithmetic

extension AnyCurrency {
  public static var zero: Self { return Self(minorUnits: 0) }

  public static func +(lhs: Self, rhs: Self) -> Self {
    return .init(minorUnits: lhs.minorUnits + rhs.minorUnits)
  }

  public static func -(lhs: Self, rhs: Self) -> Self {
    return .init(minorUnits: lhs.minorUnits - rhs.minorUnits)
  }

  public static func *(lhs: Self, rhs: Self) -> Self {
    return Self(scalingAndRounding: lhs.amount * rhs.amount)
  }

  public static func /(lhs: Self, rhs: Self) -> Self {
    return Self(scalingAndRounding: lhs.amount / rhs.amount)
  }

  public static func +=(lhs: inout Self, rhs: Self) { lhs = lhs + rhs }
  public static func -=(lhs: inout Self, rhs: Self) { lhs = lhs - rhs }
  public static func *=(lhs: inout Self, rhs: Self) { lhs = lhs * rhs }
  public static func /=(lhs: inout Self, rhs: Self) { lhs = lhs / rhs }

  /// Returns the current value as its additive inverse.
  ///
  /// The following example uses the `negated()` method to negate the currency value:
  ///
  ///     let negativeAmount = USD(3.40).negated()
  ///     // negativeAmount == USD(-3.40)
  ///
  /// - Note: The minimum value of fixed-width integer types cannot be represented when negated, as it causes an integer overflow.
  /// e.g. `Int8.min` is `-128` while `Int8.max` is `127`.
  ///
  /// If the resulting value is not representable within an `Int64`, then the value will be clamped to `Int64.max` to avoid integer overflow.
  ///
  /// For example:
  ///
  ///     let negationOverflow = USD(minorUnits: Int64.min).negated()
  ///     // negationOverflow == USD(minorUnits: Int64.max)
  /// - Complexity: O(1)
  public func negated() -> Self {
    // overflow of integer by flipping the sign can only happen when going from negative to positive
    // this is because any valid positive value can be represented as its negative inverse - but the inverse is not true
    // Int8.min == -128, while Int8.max == 127
    let result = self.minorUnits.multipliedReportingOverflow(by: -1)
    return .init(minorUnits: result.overflow ? Int64.max : result.partialValue)
  }
}

// MARK: String Representation

// price.description                  3000.98 USD
// price.debugDescription         USD(3000.98)
// price.playgroundDescription    USD(3000.98)
// "\(localize: price)"                       $3,000.98
// "\(localize: price, withFormatter: ...)"   $3,000.98
// "\(localize: price, forLocale: .current)"  $3,000.98

extension AnyCurrency {
  public var description: String { return "\(self.amount.description) \(Self.metadata.alphabeticCode)" }
  public var debugDescription: String { return "\(Self.metadata.alphabeticCode)(\(self.amount.description))"}
  public var playgroundDescription: Any { return self.debugDescription }
}

extension String.StringInterpolation {
  public mutating func appendInterpolation<Currency: AnyCurrency>(
    localize value: Currency?,
    forLocale locale: Locale = .current,
    nilDescription nilValue: String = "nil"
  ) {
    guard case let .some(value) = value else { return nilValue.write(to: &self) }

    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.locale = locale
    formatter.currencyCode = Currency.metadata.alphabeticCode

    self.appendInterpolation(localize: value, withFormatter: formatter, nilDescription: nilValue)
  }

  public mutating func appendInterpolation<Currency: AnyCurrency>(
    localize value: Currency?,
    withFormatter formatter: NumberFormatter,
    nilDescription nilValue: String = "nil"
  ) {
    guard case let .some(value) = value else { return nilValue.write(to: &self) }

    guard let localizedString = formatter.string(from: value.amount as NSDecimalNumber) else {
      nilValue.write(to: &self)
      return
    }

    localizedString.write(to: &self)
  }
}
