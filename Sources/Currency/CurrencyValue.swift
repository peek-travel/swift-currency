//===----------------------------------------------------------------------===//
//
// This source file is part of the SwiftCurrency open source project
//
// Copyright (c) 2024 SwiftCurrency project authors
// Licensed under MIT License
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of SwiftCurrency project authors
//
// SPDX-License-Identifier: MIT
//
//===----------------------------------------------------------------------===//

import struct Foundation.Decimal
import class Foundation.NSDecimalNumber
import func Foundation.NSDecimalRound

/// A monetary numeric value representing a currency.
///
/// **Value Representation**
///
/// All currencies have a "minorUnits" scale, as defined by their ``CurrencyDescriptor``
/// that determine their precision when represented as a `Foundation.Decimal`.
///
/// For example, as the USD uses 1/100 for its minor unit, with the value `USD(1.0)`, `minorUnits` will be the value `100`.
///
/// _Equality comparisons and most arithmetic operations use this value._
public protocol CurrencyValue:
  CustomStringConvertible, CustomDebugStringConvertible, CustomPlaygroundDisplayConvertible,
  CustomReflectable,
  Comparable, Hashable,
  ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral,
  AdditiveArithmetic
{
  /// The information describing the currency.
  static var descriptor: CurrencyDescriptor.Type { get }

  /// The exact amount of money being represented,
  /// even if the value is fractional of what the currency uses for its minor units.
  ///
  /// e.g. If the the currency is `USD` which uses 2 minor units (1/100th), the ``exactAmount`` may be `2.00389`.
  ///
  /// For an amount that is likely to be used in "every day" usage, see ``roundedAmount``
  var exactAmount: Decimal { get }

  /// Creates a representation of the currency with the exact value as given.
  /// - Parameter exactAmount: The amount this instance should represent, without any rounding.
  init(exactAmount: Decimal)
}

// MARK: Defaults

extension CurrencyValue where Self: CurrencyDescriptor {
  public static var descriptor: CurrencyDescriptor.Type { Self.self }
}

// MARK: Extensions

extension CurrencyValue {
  /// The amount represented as a whole number of the curreny's "minor units".
  ///
  /// For example, as the USD uses 1/100 for its minor unit,
  /// with the value of `USD 1.01`, ``minorUnits`` will be the value `101`.
  /// - Important: Fractional values of the currency are truncated.
  public var minorUnits: CurrencyMinorUnitRepresentation {
    let scaledAmount = self.exactAmount * Self.descriptor.minorUnitsCoefficient(for: .exactAmount)
    return .init(scaledAmount.int64Value)
  }

  /// The "every day" representation of the ``exactAmount`` of money this value represents,
  /// rounded using the `bankers` method to the currency's ``CurrencyDescriptor/minorUnits``.
  ///
  /// For example:
  /// ```swift
  ///     let usd = USD(10.007)
  ///     let yen = JPY(100.9)
  ///     let dinar = KWD(100.0019)
  ///
  ///     print(usd, yen, dinar)
  ///     // "USD(10.01), JPY(101), KWD(100.002)
  /// ```
  public var roundedAmount: Decimal { self.roundedAmount(using: .bankers) }

  /// Creates a representation of the currency, converting the minor units representation to a decimal format.
  ///
  /// e.g. If you provide the value `100` for a currency with `2` minor units, the `exactAmount` will be `1.00`.
  /// - Parameter minorUnits: The minor units this value will represent.
  public init(minorUnits: CurrencyMinorUnitRepresentation) {
    let amount = Decimal(minorUnits) * Self.descriptor.minorUnitsCoefficient(for: .minorUnits)
    self.init(exactAmount: amount)
  }

  /// Rounds the ``exactAmount`` of money being represented using the given rounding method
  /// to the currency's ``CurrencyDescriptor/minorUnits``.
  /// - Parameter roundingMode: The desired rounding mode to use on the original ``exactAmount``.
  /// - Complexity: O(1)
  /// - Returns: The rounded amount.
  public func roundedAmount(using roundingMode: NSDecimalNumber.RoundingMode) -> Decimal {
    var sourceAmount = self.exactAmount
    var result = Decimal.zero
    NSDecimalRound(&result, &sourceAmount, .init(Self.descriptor.minorUnits), roundingMode)
    return result
  }
}

// MARK: Equatable

extension CurrencyValue {
  public static func ==<Other: CurrencyValue>(lhs: Self, rhs: Other) -> Bool {
    guard Self.descriptor == Other.descriptor else { return false }
    return lhs.exactAmount == rhs.exactAmount
  }
}

// MARK: Comparable

extension CurrencyValue {
  public static func < <Other: CurrencyValue>(lhs: Self, rhs: Other) -> Bool {
    guard Self.descriptor == Other.descriptor else {
      return Self.descriptor.alphabeticCode < Other.descriptor.alphabeticCode
    }
    return lhs.exactAmount < rhs.exactAmount
  }
}

// MARK: Hashable

extension CurrencyValue {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(ObjectIdentifier(Self.descriptor))
    hasher.combine(self.exactAmount)
  }
}

// MARK: CustomReflectable

extension CurrencyValue {
  public var customMirror: Mirror {
    return .init(self, children: [
      "exactAmount": self.exactAmount,
      "minorUnits": self.minorUnits,
      "descriptor": Self.descriptor
    ])
  }
}

// MARK: Literal Representations

extension CurrencyValue {
  public init(floatLiteral value: Double) {
    self.init(exactAmount: Decimal(value))
  }

  public init(integerLiteral value: Int) {
    self.init(exactAmount: Decimal(value))
  }
}
