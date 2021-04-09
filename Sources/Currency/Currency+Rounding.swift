//===----------------------------------------------------------------------===//
//
// This source file is part of the SwiftCurrency open source project
//
// Copyright (c) 2021 SwiftCurrency project authors
// Licensed under MIT License
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of SwiftCurrency project authors
//
// SPDX-License-Identifier: MIT
//
//===----------------------------------------------------------------------===//

import Foundation

/// The default rounding mode used by the Currency library.
///
/// See `Foundation.Decimal.RoundingMode.bankers`.
public let kCurrencyDefaultRoundingMode = Decimal.RoundingMode.bankers

extension Currency {
  /// The `plain` rounded monetary amount being represented, as defined by the currency.
  ///
  /// For example:
  ///
  ///     let usd = USD(10.007).roundedAmount
  ///     // usd == 10.01
  ///
  ///     let yen = JPY(100.9).roundedAmount
  ///     // yen == 101
  ///
  ///     let dinar = KWD(100.0019).roundedAmount
  ///     // dinar == 100.002
  ///
  /// See `CurrencyMetadata.minorUnits` and `kCurrencyDefaultRoundingMode`.
  public var roundedAmount: Decimal { return self.roundedAmount(using: kCurrencyDefaultRoundingMode) }

  /// The rounded monetary amount being represented, as defined by the currency, using the desired rounding mode.
  ///
  /// See `Foundation.Decimal.RoundingMode`
  /// - Parameter mode: The rounding mode to use.
  public func roundedAmount(using mode: Decimal.RoundingMode) -> Decimal {
    return self.rawValue.rounded(to: self.metadata.minorUnits, using: mode)
  }
}

extension Decimal {
  internal init(scaledValue: Int64, scale: UInt8) {
    let value = Self(scaledValue)
    self = value.rounded(to: scale, using: kCurrencyDefaultRoundingMode) * Decimal(
      sign: .plus,
      exponent: .init(scale) * -1,
      significand: 1
    )
  }

  @usableFromInline
  internal func rounded(to minorUnits: UInt8, using mode: Decimal.RoundingMode) -> Decimal {
    return withUnsafePointer(to: self) { value in

    let scale = Int(minorUnits)
    var result = Decimal.zero

    NSDecimalRound(&result, value, scale, mode)

    return result
    }
  }
}
