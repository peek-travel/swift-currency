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

import struct Foundation.Locale
import class Foundation.NumberFormatter
import class Foundation.NSDecimalNumber

// price.description                    3000.98 USD
// price.debugDescription           USD(3000.98)
// price.playgroundDescription      USD(3000.98)
// "\(localize: price)"               $3,000.98
// "\(localize: price, with: ...)"    $3,000.98
// "\(localize: price, for: ...)"     $3,000.98

// MARK: CustomStringConvertible

extension CurrencyValue {
  public var description: String { "\(self.exactAmount) \(Self.descriptor.alphabeticCode)"}
  public var debugDescription: String {
    "\(Self.descriptor.alphabeticCode)(exact: \(self.exactAmount.description), minorUnits: \(self.minorUnits)"
  }
  public var playgroundDescription: Any { self.debugDescription }
}

// MARK: Localization

extension String.StringInterpolation {
  /// Creates a string representation of the currency value, localized to a particular locale.
  ///
  /// Example
  ///
  ///       let pounds = GBP(30.03)
  ///       let localizedString = "\(localize: pounds, for: Locale(identifier: "de_DE"))"
  ///       print(localizedString)
  ///       // 30,03 £
  ///       print("\(localize: pounds)")
  ///       // £30.03, assuming `Locale.current` is "en_US"
  ///
  /// This can also be done with a method on the value itself:
  ///
  ///       let usd = USD(30.03)
  ///       print(usd.localizedString(for: .init(identifier: "fr_FR")))
  ///       // 30,03 $US
  ///       print(usd.localizedString())
  ///       // $30.03, assuming `Locale.current` is "en_US"
  ///
  /// - Important: This creates a new `NumberFormatter` every time it is called.
  /// If you have a cached instance, use `(localize:with:nilDescription:)` instead.
  /// - Parameters:
  ///   - value: The value to localize. If the value is `nil`, then the `nilDescription` will be used.
  ///   - locale: The Locale to localize the value for. The default is `.current`, ig. the runtime environment's Locale.
  ///   - nilDescription: The optional description to use when the `value` is `nil`.
  public mutating func appendInterpolation<Currency: CurrencyValue>(
    localize value: Currency?,
    for locale: Locale = .current,
    nilDescription: String = "nil"
  ) {
    guard case let .some(value) = value else { return nilDescription.write(to: &self) }

    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.locale = locale
    formatter.currencyCode = Currency.descriptor.alphabeticCode

    self.appendInterpolation(localize: value, with: formatter, nilDescription: nilDescription)
  }

  /// Creates a string representation of the currency value, using the provided formatter.
  ///
  ///       let formatter = ...
  ///       let currency = ...
  ///       let localizedString = "\(localize: currency, with: formatter)"
  ///
  /// This can also be done with a method on the value itself:
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
  /// - Important: This method does not modify the given `Foundation.NumberFormatter`.
  /// If the same formatter is to be used for different currencies,
  /// the property will need to be updated before calling this method.
  /// - Parameters:
  ///   - value: The value to localize. If the value is `nil`, then the `nilDescription` will be used.
  ///   - formatter: The pre-configured formatter to use.
  ///   - nilDescription: The optional description to use when the `value` is `nil`.
  public mutating func appendInterpolation<Currency: CurrencyValue>(
    localize value: Currency?,
    with formatter: NumberFormatter,
    nilDescription: String = "nil"
  ) {
    guard case let .some(value) = value else { return nilDescription.write(to: &self) }

    guard let localizedString = formatter.string(from: value.exactAmount as NSDecimalNumber) else {
      nilDescription.write(to: &self)
      return
    }

    localizedString.write(to: &self)
  }
}

extension CurrencyValue {
  /// Creates a string representation of the currency value, localized to a particular locale.
  ///
  ///       let usd = USD(30.03)
  ///       print(usd.localizedString(for: .init(identifier: "fr_FR")))
  ///       // 30,03 $US
  ///       print(usd.localizedString())
  ///       // $30.03, assuming `Locale.current` is "en_US"
  ///
  /// This can also be done with String interpolation:
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
  /// - Returns: A localized String representation of the currency value.
  public func localizedString(for locale: Locale = .current) -> String {
    return "\(localize: self, for: locale)"
  }

  /// Creates a string representation of the currency value, using the provided formatter.
  ///
  ///      let formatter = NumberFormatter()
  ///      formatter.numberStyle = .currency
  ///      formatter.currencyGroupingSeparator = " "
  ///      formatter.currencyDecimalSeparator = "'"
  ///      formatter.currencyCode = "GBP"
  ///
  ///      let pounds = GBP(14928.02)
  ///      print(pounds.localizedString(using: formatter))
  ///      // £14 928'02
  ///
  /// This can also be done with String interpolation:
  ///
  ///       let formatter = ...
  ///       let currency = ...
  ///       let localizedString = "\(localize: currency, with: formatter)"
  ///
  /// - Important: This method does not modify the given `Foundation.NumberFormatter`.
  /// If the same formatter is to be used for different currencies, the property will need to be updated before calling this method.
  /// - Parameters:
  ///   - formatter: The pre-configured formatter to use.
  /// - Returns: A localized String representation of the currency value.
  public func localizedString(using formatter: NumberFormatter) -> String {
    return "\(localize: self, with: formatter)"
  }
}
