//===----------------------------------------------------------------------===//
//
// This source file is part of the Currency open source project
//
// Copyright (c) 2020 Currency project authors
// Licensed under MIT License
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of Currency project authors
//
// SPDX-License-Identifier: MIT
//
//===----------------------------------------------------------------------===//

import Foundation

/// A type-erased representation of a currency, with a single `Foundation.Decimal` holding the exact value.
///
/// Conforming types will also provide `CurrencyMetadata` to access specific ISO 4217 information, such as the alphabetic code and "minor units".
///
/// **Initialization**
///
/// As `Foundation.Decimal` has different precision to `BinaryFloatingPoint`, precision will be lost when initializing using float literals.
///
/// **Equality Comparisons**
///
/// Floating point values are notorious for having precision variance, even when they are equivalent within the precision range a developer desires.
///
/// To overcome this, all equality checks between two given currencies will use the `roundedAmount` by default.
public protocol AnyCurrency {
  /// The ISO 4217 information about this currency.
  static var metadata: CurrencyMetadata.Type { get }

  /// The exact amount of money being represented.
  /// - Note: This is likely to be more precise than necessary, so it is recommended to use `roundedAmount` which uses "bankers" rounding.
  var exactAmount: Decimal { get }

  /// The "bankers" rounded amount of money being represented.
  ///
  /// The `exactAmount` will be rounded to the significant digits as defined by the currency's "minorUnits".
  ///
  /// See `CurrencyMetadata.minorUnits` and `Foundation.Decimal.RoundingMode.bankers`.
  /// - Note: This is usually the desired value to work with, as `exactAmount` could be more precise than needed.
  var roundedAmount: Decimal { get }
  
  /// Initializes a representation of the provided amount.
  /// - Parameter amount: The exact amount this instance should represent.
  init(_ amount: Decimal)
}

// MARK: Computed Properties

fileprivate func round(_ amount: Decimal, to scale: UInt8) -> Decimal {
  var result = Decimal.zero
  withUnsafePointer(to: amount) { NSDecimalRound(&result, $0, Int(scale), .bankers) }
  return result
}

extension AnyCurrency {
  /// The ISO 4217 information about this currency.
  public var metadata: CurrencyMetadata.Type { return Self.metadata }
  public var roundedAmount: Decimal { return round(self.exactAmount, to: Self.metadata.minorUnits) }
}

extension AnyCurrency where Self: CurrencyMetadata {
  public static var metadata: CurrencyMetadata.Type { return Self.self }
}

extension AnyCurrency {
  /// Initializes a currency value from it's smallest unit.
  ///
  /// For example, the USD has cents, which are 1/100 of 1 USD. Calling `USD(minorUnits: 100)` will create a value of `1.0`.
  ///
  /// See `CurrencyMetadata.minorUnits`.
  /// - Parameter minorUnits: The amount of the smallest units in the currency to initialize with.
  public init(minorUnits: Int) {
    self.init(.zero)
    let minorUnitsScale = Int16(Self.metadata.minorUnits) * -1
    let scaledTotal = NSDecimalNumber(value: minorUnits).multiplying(byPowerOf10: minorUnitsScale)
    self = .init(scaledTotal.decimalValue)
  }
}

// MARK: -
// MARK: Arithmetic

extension AnyCurrency {
  public static func +(lhs: Self, rhs: Self) -> Self {
    return .init(lhs.exactAmount + rhs.exactAmount)
  }
  
  public static func -(lhs: Self, rhs: Self) -> Self {
    return .init(lhs.exactAmount - rhs.exactAmount)
  }
  
  public static func *(lhs: Self, rhs: Self) -> Self {
    return .init(lhs.exactAmount * rhs.exactAmount)
  }
  
  public static func /(lhs: Self, rhs: Self) -> Self {
    return .init(lhs.exactAmount / rhs.exactAmount)
  }
  
  public static func +=(lhs: inout Self, rhs: Self) { lhs = lhs + rhs }
  public static func -=(lhs: inout Self, rhs: Self) { lhs = lhs - rhs }
  public static func *=(lhs: inout Self, rhs: Self) { lhs = lhs * rhs }
  public static func /=(lhs: inout Self, rhs: Self) { lhs = lhs / rhs }
  
  public static func +(lhs: Self, rhs: Decimal) -> Self {
    return .init(lhs.exactAmount + rhs)
  }
  
  public static func -(lhs: Self, rhs: Decimal) -> Self {
    return .init(lhs.exactAmount - rhs)
  }
  
  public static func *(lhs: Self, rhs: Decimal) -> Self {
    return .init(lhs.exactAmount * rhs)
  }
  
  public static func /(lhs: Self, rhs: Decimal) -> Self {
    return .init(lhs.exactAmount / rhs)
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
    return lhs.roundedAmount == rhs.roundedAmount
  }
  
  /// Checks if the current rounded amount is equivalent to the provided value.
  ///
  /// As floating point type precisions can vary, doing exact comparisons to `exactAmount` values can result in false negatives.
  ///
  /// To get around this, the provided `other` amount will be rounded to the same precision as the currency's "minorUnits" using the "bankers" mode.
  ///
  /// See `AnyCurrency.roundedAmount` and `Foundation.Decimal.RoundingMode.bankers`.
  /// - Parameter other: The other amount to compare against, after "bankers" rounding it.
  /// - Returns: `true` if the rounded values are equal, otherwise `false`.
  public func isEqual(to other: Decimal) -> Bool {
    return self.roundedAmount == round(other, to: Self.metadata.minorUnits)
  }
  
  /// Checks if the current rounded amount is equivalent to the other instance's.
  ///
  /// As floating point type precisions can vary, doing exact comparisons to `exactAmount` values can result in false negatives.
  ///
  /// To get around this, the `roundedAmount` values will be compared.
  ///
  /// See `AnyCurrency.roundedAmount`.
  /// - Parameter other: The other currency value to check if the rounded amounts are equal.
  /// - Returns: `true` if the currencies are the same type, and the rounded amounts are equal. Otherwise, `false`.
  public func isEqual<M: AnyCurrency>(to other: M) -> Bool { return self == other }
}

// MARK: Comparable

extension AnyCurrency {
  public static func <(lhs: Self, rhs: Self) -> Bool {
    return lhs.exactAmount < rhs.exactAmount
  }
}

// MARK: Hashable

extension AnyCurrency {
  public var hashValue: Int { return self.exactAmount.hashValue }
  
  public func hash(into hasher: inout Hasher) {
    hasher.combine(self.exactAmount)
  }
}

// MARK: -
// MARK: ExpressibleByIntegerLiteral

extension AnyCurrency {
  public init(integerLiteral value: Int) {
    self.init(Decimal(integerLiteral: value))
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
  public var description: String { return "\(self.roundedAmount.description) \(Self.metadata.alphabeticCode)" }
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
    self.appendInterpolation(formatter.string(from: NSDecimalNumber(decimal: money.roundedAmount)) ?? nilValue)
  }
}
