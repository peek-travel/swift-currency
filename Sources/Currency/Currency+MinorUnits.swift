//
//  Currency+MinorUnits.swift
//  Currency
//
//  Created by Nathan Harris on 4/11/21.
//

import Foundation

public protocol RepresentableAsCurrencyMinorUnits: Currency {
  /// The `bankers` rounded amount as it can be represented in the currency's "minor Units".
  /// For example:
  ///
  ///     let usd = USD(10.007).minorUnits
  ///     // usd == 1_001
  ///
  ///     let yen = JPY(100.9).minorUnits
  ///     // yen == 101
  ///
  ///     let dinar = KWD(100.0019).minorUnits
  ///     // dinar == 100_002
  ///
  /// See `CurrencyMetadata.minorUnits` and `kCurrencyDefaultRoundingMode`.
  var minorUnits: Int64 { get }
  
  @inlinable
  init<T: BinaryInteger>(minorUnits: T)
  
  /// The rounded amount as it can be represented in the currency's "minor units", using the desired rounding mode.
  ///
  /// See `Foundation.Decimal.RoundingMode`
  /// - Parameter mode: The rounding mode to use.
  func minorUnits(roundedUsing mode: Decimal.RoundingMode) -> Int64
}

extension RepresentableAsCurrencyMinorUnits {
  @inlinable
  public init<T: BinaryInteger>(minorUnits: T) {
    let amount = Decimal(Int64(minorUnits)) * .init(
      sign: .plus,
      exponent: .init(Self.zero.metadata.minorUnits) * -1,
      significand: 1
    )
    self.init(exactly: amount)
  }

  public var minorUnits: Int64 { return self.minorUnits(roundedUsing: kCurrencyDefaultRoundingMode) }

  public func minorUnits(roundedUsing mode: Decimal.RoundingMode) -> Int64 {
    let scaledAmount = self.roundedAmount(using: mode) * Decimal(
      sign: .plus,
      exponent: .init(self.metadata.minorUnits),
      significand: 1
    )
    return NSDecimalNumber(decimal: scaledAmount).int64Value
  }
}
