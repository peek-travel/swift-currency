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

/// A representation of a given monetary value.
public protocol Currency:
  Comparable, Hashable,
  CustomLeafReflectable,
  CustomStringConvertible, CustomDebugStringConvertible, CustomPlaygroundDisplayConvertible,
  AdditiveArithmetic,
  ExpressibleByStringLiteral, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral
{
  /// The absolute raw monetary value being represented, which may have more fractional units than the currency's "minor units".
  ///
  /// For example, while the USD only has a "minor units" of 2, this value could have a fractional unit of `3` when representing a value such as `2.983`.
  var rawValue: Decimal { get }

  /// Creates an exact representation of the amount provided.
  ///
  /// This initializer is highly **discouraged** from use, as the `init(amount:)` provides checks on the given value.
  /// - Parameter rawValue: The amount to be wrapped in the currency representation.
  init(exactly: Decimal, metadata: CurrencyMetadata.Type)

  /// The ISO 4217 information about this currency.
  var metadata: CurrencyMetadata.Type { get }
}

extension Currency where Self: CurrencyMetadata {
  public var metadata: CurrencyMetadata.Type { return Self.self }

  public init(exactly: Decimal) {
    self.init(exactly: exactly, metadata: Self.self)
  }
}

extension Currency {
  /// Create a representation of the amount provided, or `nil` if `NaN`.
  public init?(_ amount: Decimal) {
    switch amount {
    case .nan, .quietNaN: return nil
    default: self.init(exactly: amount, metadata: self.metadata)
    }
  }
}

// MARK: Equatable, Comparable, Hashable
extension Currency {
  public static func ==(lhs: Self, rhs: Self) -> Bool {
    return lhs.roundedAmount == rhs.roundedAmount
  }

  public static func <(lhs: Self, rhs: Self) -> Bool {
    return lhs.rawValue < rhs.rawValue
  }

  public func hash(into hasher: inout Hasher) {
    hasher.combine(self.roundedAmount)
  }
}

// MARK: AdditiveArithmetic
extension Currency {
  public static var zero: Self { return Self(exactly: 0) }

  public static func +(lhs: Self, rhs: Self) -> Self {
    return .init(exactly: lhs.rawValue + rhs.rawValue)
  }
  
  public static func -(lhs: Self, rhs: Self) -> Self {
    return .init(exactly: lhs.rawValue - rhs.rawValue)
  }
  
  public static func +=(lhs: inout Self, rhs: Self) { lhs = lhs + rhs }
  public static func -=(lhs: inout Self, rhs: Self) { lhs = lhs - rhs }
}

// MARK: Additional Arithmetic
extension Currency {
  // perhaps do this generic w/ Numeric, Double, Decimal, etc. will be supported
  // look at Numerics lib for "better" Decimal
  // concrete overloads will be faster to compile, perhaps convert to method instead of operator
  public static func *(lhs: Self, rhs: Self) -> Self {
    return .init(exactly: lhs.rawValue * rhs.rawValue)
  }
  public static func *(lhs: Self, rhs: Double) -> Self {
    return .init(exactly: lhs.rawValue * rhs)
  }
  
  public static func /(lhs: Self, rhs: Self) -> Self {
    return .init(exactly: lhs.rawValue / rhs.rawValue)
  }
  
  public static func *=(lhs: inout Self, rhs: Self) { lhs = lhs * rhs }
  public static func /=(lhs: inout Self, rhs: Self) { lhs = lhs / rhs }

  /// Returns the current value as its additive inverse.
  ///
  /// The following example uses the `negated()` method to negate the currency value:
  ///
  ///     let negativeAmount = USD(3.40).negated()
  ///     // negativeAmount == USD(-3.40)
  public func negated() -> Self {
    var value = self.rawValue
    value.negate()
    return .init(exactly: value)
  }
}

// MARK: Expressible by Literals
extension Currency {
  public init(stringLiteral value: String) {
    self.init(exactly: Decimal(string: value)!)
  }

  public init(integerLiteral value: Int64) {
    self.init(exactly: Decimal(value))
  }

  public init(floatLiteral value: Double) {
    // because the conversion from Double to Decimal is lossy,
    // we take the string representation and use that to construct the Decimal value
    self.init(stringLiteral: value.description)
  }
}

// MARK: String Representation

// price.description                    3000.98 USD
// price.debugDescription           USD(3000.98)
// price.playgroundDescription      USD(3000.98)
// "\(localize: price)"               $3,000.98
// "\(localize: price, with: ...)"    $3,000.98
// "\(localize: price, for: ...)"     $3,000.98

extension Currency {
  public var description: String { return "\(self.roundedAmount.description) \(self.metadata.alphabeticCode)" }
  public var debugDescription: String { return "\(self.metadata.alphabeticCode)(\(self.rawValue.description))" }
  public var playgroundDescription: Any { return self.debugDescription }
  
  /// Creates a string representation of the currency value, localized to a particular locale.
  ///
  ///       let usd = USD(30.03)
  ///       print(usd.localizedString(for: .init(identifier: "fr_FR")))
  ///       // 30,03 $US
  ///       print(usd.localizedString())
  ///       // $30.03, assuming `Locale.current` is "en_US"
  ///
  /// - Note: This can also be done with String interpolation:
  ///
  ///       let pounds = GBP(30.03)
  ///       let localizedString = "\(localize: pounds, for: Locale(identifier: "de_DE"))"
  ///       print(localizedString)
  ///       // 30,03 £
  ///       print("\(localize: pounds)")
  ///       // £30.03, assuming `Locale.current` is "en_US"
  ///
  /// - Parameters:
  ///   - locale: The Locale to localize the value for. The default is `.current`, ig. the runtime environment's Locale.
  ///   - nilValue: The String representation to use if the value is `nil` or localization fails. The default is `"nil"`.
  /// - Returns: A localized String representation of the currency value.
  public func localizedString(for locale: Locale = .current, nilDescription nilValue: String = "nil") -> String {
    return "\(localize: self, for: locale, nilDescription: nilValue)"
  }

  /// Creates a string representation of the currency value, using the provided formatter.
  ///
  ///       let formatter = NumberFormatter()
  ///       formatter.numberStyle = .currency
  ///       formatter.currencyGroupingSeparator = " "
  ///       formatter.currencyDecimalSeparator = "'"
  ///       formatter.currencyCode = "GBP"
  ///
  ///       let pounds = GBP(14928.02)
  ///       print(pounds.localizedString(using: formatter))
  ///       // £14 928'02
  ///
  ///- Note: This can also be done with String interpolation:
  ///
  ///       let formatter = ...
  ///       let currency = ...
  ///       let localizedString = "\(localize: currency, with: formatter)"
  ///
  /// - Important: Since `Foundation.NumberFormatter` is a class, this method does not set the `currencyCode` property automatically.
  ///
  /// If it did, this method would no longer be thread safe, and would mutate the provided instance.
  ///
  /// If the same formatter is to be used for different currencies, the property will need to be updated before calling this method.
  ///
  /// - Parameters:
  ///   - formatter: The pre-configured formatter to use.
  ///   - nilValue: The String representation to use if the value is `nil` or localization fails. The default is `"nil"`.
  /// - Returns: A localized String representation of the currency value.
  public func localizedString(using formatter: NumberFormatter, nilDescription nilValue: String = "nil") -> String {
    return "\(localize: self, with: formatter, nilDescription: nilValue)"
  }
}

extension String.StringInterpolation {
  public mutating func appendInterpolation<M: Currency>(
    localize value: M?,
    for locale: Locale = .current,
    nilDescription nilValue: String = "nil"
  ) {
    guard case let .some(value) = value else { return nilValue.write(to: &self) }

    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.locale = locale
    formatter.currencyCode = value.metadata.alphabeticCode

    self.appendInterpolation(localize: value, with: formatter, nilDescription: nilValue)
  }

  public mutating func appendInterpolation<M: Currency>(
    localize value: M?,
    with formatter: NumberFormatter,
    nilDescription nilValue: String = "nil"
  ) {
    guard case let .some(value) = value else { return nilValue.write(to: &self) }

    guard let localizedString = formatter.string(from: NSDecimalNumber(decimal: value.roundedAmount)) else {
      nilValue.write(to: &self)
      return
    }

    localizedString.write(to: &self)
  }
}

// MARK: CustomLeafReflectable
extension Currency {
  public var customMirror: Mirror {
    return .init(self, children: [
      "rawValue": self.rawValue.description,
      "bankersRoundedAmound": self.roundedAmount.description,
      "metadata": (
        name: self.metadata.name,
        alphabeticCode: self.metadata.alphabeticCode,
        numericCode: self.metadata.numericCode,
        minorUnits: self.metadata.minorUnits
      )
    ])
  }
}
