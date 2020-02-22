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

/// A representation of a value in a specific currency.
///
/// When a value instance needs to be used outside of a generic context, the `AnyCurrency` protocol can be used as an existential.
///
/// `CurrencyProtocol` provides the same functionality of `AnyCurrency`,
/// in addition to `Comparable`, `Hashable`, `ExpressibleByIntegerLiteral` and `ExpressibleByFloatLiteral`.
public protocol CurrencyProtocol: AnyCurrency,
  Comparable, Hashable,
  AdditiveArithmetic,
  ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral
{ }

// MARK: Default Implementations

extension CurrencyProtocol {
  public init(floatLiteral value: Double) {
    self.init(scalingAndRounding: Decimal(value))
  }

  public init(integerLiteral value: Int64) {
    self.init(scalingAndRounding: Decimal(value))
  }
}

// MARK: AnyCurrency Implementation Overrides

extension CurrencyProtocol {
  public static var zero: Self { return Self(minorUnits: 0) }

  // https://bugs.swift.org/browse/SR-12128
  #if swift(>=5.2)
  public static func +=(lhs: inout Self, rhs: Self) { lhs = lhs + rhs }
  public static func -=(lhs: inout Self, rhs: Self) { lhs = lhs - rhs }
  #endif
}
