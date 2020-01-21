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

/// A type-erased representation of a currency.
///
/// Conforming types will also provide `CurrencyMetadata` to access specific ISO 4217 information, such as the alphabetic code and "minor units".
///
/// **Value Storage**
///
/// All currencies have a "minorUnits" scale, as defined by their `CurrencyMetadata` that determine their precision when represented as a `Foundation.Decimal`.
///
/// This "minorUnits" scale is the value that is stored within the currency for use in arithmetic and value comparisons.
///
/// **Initialization**
///
/// All values will be "bankers" rounded before being stored within the value. So a value of `USD(1.982)` will be stored as `1.98`.
public protocol AnyCurrency {
  /// The ISO 4217 information about this currency.
  static var metadata: CurrencyMetadata.Type { get }
  
  /// The amount represented as a whole number of the currency's "minorUnits".
  ///
  /// For example, as the USD uses 1/100 for its minor unit, with the value `USD(1.0)`, `minorUnits` will be the value `100`.
  ///
  /// See `CurrencyMetadata.minorUnits` and `Foundation.RoundingMode.bankers`.
  /// - Note: All equality comparisons will use this value.
  var minorUnits: Int64 { get }
  
  /// The amount of money being represented.
  var amount: Decimal { get }
  
  /// Initializes a currency to the exact value of it's smallest unit.
  ///
  /// For example, the USD has cents, which are 1/100 of 1 USD. Calling `USD(minorUnits: 100)` will create a value of `1.0`.
  ///
  /// See `CurrencyMetadata.minorUnits`.
  /// - Parameter minorUnits: The amount of the smallest units in the currency to initialize with.
  init(exactly minorUnits: Int64)
  /// Initializes a representation of the provided amount after "bankers" rounding the value
  ///
  /// The rounding pecision is defined by the currency's "minorUnits".
  ///
  /// See `CurrencyMetadata.minorUnits` and `Foundation.Decimal.RoundingMode.bankers`.
  /// - Parameter amount: The exact amount this instance should represent.
  init(_ amount: Decimal)
}

// MARK: Computed Properties

extension AnyCurrency {
  /// The ISO 4217 information about this currency.
  public var metadata: CurrencyMetadata.Type { return Self.metadata }
  
  public var amount: Decimal {
    return .init(minorUnits) * .init(
      sign: .plus,
      exponent: -Int(Self.metadata.minorUnits),
      significand: 1
    )
  }

  /// The current value with it's sign reversed.
  ///
  /// For example:
  ///
  ///     USD(3.40).inverse == USD(-3.40)
  ///
  public var inverseAmount: Self { return .init(exactly: self.minorUnits * -1) }
}

extension AnyCurrency where Self: CurrencyMetadata {
  public static var metadata: CurrencyMetadata.Type { return Self.self }
}

extension AnyCurrency {
  public init(_ amount: Decimal) {
    var sourceAmount = amount
    var roundedAmount = Decimal.zero
    NSDecimalRound(&roundedAmount, &sourceAmount, .init(Self.metadata.minorUnits), .bankers)
    let scaledAmount = roundedAmount * Decimal(
      sign: .plus,
      exponent: .init(Self.metadata.minorUnits),
      significand: 1
    )
    self.init(exactly: NSDecimalNumber(decimal: scaledAmount).int64Value)
  }
}

// MARK: -
// MARK: Arithmetic

extension AnyCurrency {
  public static func +(lhs: Self, rhs: Self) -> Self {
    return .init(exactly: lhs.minorUnits + rhs.minorUnits)
  }
  
  public static func -(lhs: Self, rhs: Self) -> Self {
    return .init(exactly: lhs.minorUnits - rhs.minorUnits)
  }
  
  public static func *(lhs: Self, rhs: Self) -> Self {
    return .init(lhs.amount * rhs.amount)
  }
  
  public static func /(lhs: Self, rhs: Self) -> Self {
    return .init(lhs.amount / rhs.amount)
  }
  
  public static func +=(lhs: inout Self, rhs: Self) { lhs = lhs + rhs }
  public static func -=(lhs: inout Self, rhs: Self) { lhs = lhs - rhs }
  public static func *=(lhs: inout Self, rhs: Self) { lhs = lhs * rhs }
  public static func /=(lhs: inout Self, rhs: Self) { lhs = lhs / rhs }
  
  public static func +(lhs: Self, rhs: Decimal) -> Self {
    return .init(lhs.amount + rhs)
  }
  
  public static func -(lhs: Self, rhs: Decimal) -> Self {
    return .init(lhs.amount - rhs)
  }
  
  public static func *(lhs: Self, rhs: Decimal) -> Self {
    return .init(lhs.amount * rhs)
  }
  
  public static func /(lhs: Self, rhs: Decimal) -> Self {
    return .init(lhs.amount / rhs)
  }
  
  public static func +=(lhs: inout Self, rhs: Decimal) { lhs = lhs + rhs }
  public static func -=(lhs: inout Self, rhs: Decimal) { lhs = lhs - rhs }
  public static func *=(lhs: inout Self, rhs: Decimal) { lhs = lhs * rhs }
  public static func /=(lhs: inout Self, rhs: Decimal) { lhs = lhs / rhs }
}

// MARK: Equatable

extension AnyCurrency {
  public static func ==<M: AnyCurrency>(lhs: Self, rhs: M) -> Bool {
    guard Self.metadata.alphabeticCode == M.metadata.alphabeticCode else { return false }
    return lhs.minorUnits == rhs.minorUnits
  }
  
  /// Checks if the current amount is equivalent to the provided value.
  ///
  /// As floating point type precisions can vary, doing exact comparisons to between two `Decimal` values can result in false negatives when the currencies
  /// are effectively the same value when compared up to their "minorUnits".
  ///
  /// To get around this, the provided `other` amount will be rounded to the same precision as the currency's "minorUnits" using the "bankers" mode.
  ///
  /// For example, `USD(30.30)` is effectively equivalent to `Decimal(30.30001)`, so `USD(30.30).isEqual(to: 30.30001)` will be `true`.
  ///
  /// See `AnyCurrency.amount` and `Foundation.Decimal.RoundingMode.bankers`.
  /// - Parameter other: The other amount to compare against, after "bankers" rounding it.
  /// - Returns: `true` if the rounded values are equal, otherwise `false`.
  public func isEqual(to other: Decimal) -> Bool {
    return self == Self(other)
  }
  
  /// Checks if the current amount is equivalent to the other instance's.
  /// - Parameter other: The other currency value to check if the amounts are equal.
  /// - Returns: `true` if the currencies are the same type and the amounts are equal. Otherwise, `false`.
  public func isEqual<M: AnyCurrency>(to other: M) -> Bool { return self == other }
}

// MARK: Comparable

extension AnyCurrency {
  public static func <(lhs: Self, rhs: Self) -> Bool {
    return lhs.minorUnits < rhs.minorUnits
  }
}

// MARK: Hashable

extension AnyCurrency {
  public var hashValue: Int { return self.minorUnits.hashValue }
  
  public func hash(into hasher: inout Hasher) {
    hasher.combine(self.minorUnits)
  }
}

// MARK: -
// MARK: ExpressibleByIntegerLiteral

extension AnyCurrency {
  public init(integerLiteral value: Int64) {
    self.init(Decimal(value))
  }
}

// MARK: ExpressibleByFloatLiteral

extension AnyCurrency {
  public init(floatLiteral value: Double) {
    self.init(Decimal(floatLiteral: value))
  }
}

// MARK: -
// MARK: CustomStringCovertible

extension AnyCurrency {
  public var description: String { return "\(self.amount.description) \(Self.metadata.alphabeticCode)" }
}

// MARK: String Interpolation

// "\(price, withFormatter: ...)"   $3,000.98
// "\(price.description)"             3000.98 USD
// "\(price, forLocale: .current)"  $3,000.98
// "\(price)"                       $3,000.98

extension String.StringInterpolation {
  public mutating func appendInterpolation(
    _ money: Optional<AnyCurrency>,
    forLocale locale: Locale = .current,
    nilDescription nilValue: String = "nil"
  ) {
    switch money {
    case .none: self.appendInterpolation(nilValue)
    case let .some(value): self.appendInterpolation(value, forLocale: locale, nilDescription: nilValue)
    }
  }
  
  public mutating func appendInterpolation(
    _ money: AnyCurrency,
    forLocale locale: Locale = .current,
    nilDescription nilValue: String = "nil"
  ) {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.locale = locale
    formatter.currencyCode = money.metadata.alphabeticCode
    self.appendInterpolation(money, withFormatter: formatter, nilDescription: nilValue)
  }
  
  public mutating func appendInterpolation(
    _ money: AnyCurrency,
    withFormatter formatter: NumberFormatter,
    nilDescription nilValue: String = "nil"
  ) {
    self.appendInterpolation(formatter.string(from: NSDecimalNumber(decimal: money.amount)) ?? nilValue)
  }
}
