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

import struct Foundation.Decimal

/// Represents a type that acts as a currency.
///
/// Any `CurrencyProtocol` type behaves exactly like an `AnyCurrency` type, while also providing other capabilities such as
/// `Comparable`, `Hashable`, etc.
///
/// This is the type to work with in most generic cases, as `AnyCurrency` is a type-erasure protocol when existentials are needed.
public protocol CurrencyProtocol: AnyCurrency,
  Comparable, Hashable,
  ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral,
  AdditiveArithmetic
{
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

// MARK: ExpressibleByIntegerLiteral

extension CurrencyProtocol {
  public init(integerLiteral value: Int64) {
    self.init(Decimal(value))
  }
}

// MARK: ExpressibleByFloatLiteral

extension CurrencyProtocol {
  public init(floatLiteral value: Double) {
    self.init(Decimal(floatLiteral: value))
  }
}
