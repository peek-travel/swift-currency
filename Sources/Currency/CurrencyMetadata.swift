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

/// A type that provides static currency information as defined by ISO 4217.
public protocol CurrencyMetadata {
  /// The name of the currency, such as "United States Dollar".
  static var name: String { get }
  /// The ISO 4217 3-digit letter currency code.
  ///
  /// For example: "USD" for "United States Dollar".
  static var alphabeticCode: String { get }
  /// The ISO 4217 3-digit numeric currency code.
  ///
  /// This code is nomally the same as the ISO 3166-1 country codes, where appropriate.
  ///
  /// For example, "United States of America" has the ISO 3166-1 code of 840, which is the same for the "USD" currency in ISO 4217.
  static var numericCode: UInt16 { get }
  /// The number of decimal digits used to express minor units of the currency.
  ///
  /// For example, the US Dollar has the minor unit (cents) that are 1/100 of a dollar. Therefore, the the minorUnits is `2`.
  ///
  /// However, the Japanese Yen has no minor unit, so it has `0` minorUnits.
  static var minorUnits: UInt8 { get }
}
