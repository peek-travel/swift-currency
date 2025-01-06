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

import Foundation

// MARK: Identity

extension Currency {
  /// The zero value.
  ///
  /// Zero is the identity element for addition. For any value,
  /// `x + .zero == x` and `.zero + x == x`.
  @inlinable
  public static var zero: Self { return Self(exactAmount: .zero) }

  /// Returns the current value as its additive inverse.
  ///
  /// The following example uses the `negated()` method to negate the currency value:
  ///
  ///     let negativeAmount = USD(3.40).negated()
  ///     // negativeAmount == USD(-3.40)
  /// - Complexity: O(1)
  @inlinable
  public func negated() -> Self {
    return Self(exactAmount: self.exactAmount * -1)
  }
}

// MARK: Addition

extension Currency {
  // perhaps convert to minor units, multiply, then convert back to decimal?

  public static func +(lhs: Self, rhs: Self) -> Self {
    return .init(exactAmount: lhs.exactAmount + rhs.exactAmount)
  }
  public static func +=(lhs: inout Self, rhs: Self) { lhs = lhs + rhs }

  /// Adds the given other amount to the current exactAmount.
  /// - Parameter amount: The other amount to add.
  @inlinable
  public mutating func add(_ amount: Self) {
    self += amount
  }
  /// Adds the other amount to the current exactAmount as a new value.
  /// - Parameter amount: The other amount to add.
  public func adding(_ amount: Self) -> Self {
    return self + amount
  }

  public static func +(lhs: Self, rhs: some BinaryInteger) -> Self {
    guard let rhs = Decimal(exactly: rhs) else {
      return .init(exactAmount: .nan)
    }
    return .init(exactAmount: lhs.exactAmount + rhs)
  }
  public static func +=(lhs: inout Self, rhs: some BinaryInteger) { lhs = lhs + rhs }

  /// Adds the given other amount to the current exactAmount.
  /// - Parameter amount: The other amount to add.
  @inlinable
  public mutating func add(_ amount: some BinaryInteger) {
    self += amount
  }
  /// Adds the other amount to the current exactAmount as a new value.
  /// - Parameter amount: The other amount to add.
  public func adding(_ amount: some BinaryInteger) -> Self {
    return self + amount
  }

  public static func +(lhs: Self, rhs: Decimal) -> Self {
    return .init(exactAmount: lhs.exactAmount + rhs)
  }
  public static func +=(lhs: inout Self, rhs: Decimal) { lhs = lhs + rhs }

  /// Adds the given other amount to the current exactAmount.
  /// - Parameter amount: The other amount to add.
  @inlinable
  public mutating func add(_ amount: Decimal) {
    self += amount
  }
  /// Adds the other amount to the current exactAmount as a new value.
  /// - Parameter amount: The other amount to add.
  public func adding(_ amount: Decimal) -> Self {
    return self + amount
  }
}

// MARK: Subtraction

extension Currency {
  // perhaps convert to minor units, multiply, then convert back to decimal?

  public static func -(lhs: Self, rhs: Self) -> Self {
    return .init(exactAmount: lhs.exactAmount - rhs.exactAmount)
  }
  public static func -=(lhs: inout Self, rhs: Self) { lhs = lhs - rhs }

  /// Subtracts the given other amount from the current exactAmount.
  /// - Parameter amount: The other amount to subtract.
  public mutating func subtract(_ amount: Self) {
    self -= amount
  }
  /// Subtracts the other amount from the current exactAmount as a new value.
  /// - Parameter amount: The other amount to subtract.
  public func subtracting(_ amount: Self) -> Self {
    return self - amount
  }

  public static func -(lhs: Self, rhs: some BinaryInteger) -> Self {
    guard let rhs = Decimal(exactly: rhs) else {
      return .init(exactAmount: .nan)
    }
    return .init(exactAmount: lhs.exactAmount - rhs)
  }
  public static func -=(lhs: inout Self, rhs: some BinaryInteger) { lhs = lhs - rhs }

  /// Subtracts the given other amount from the current exactAmount.
  /// - Parameter amount: The other amount to subtract.
  public mutating func subtract(_ amount: some BinaryInteger) {
    self -= amount
  }
  /// Subtracts the other amount from the current exactAmount as a new value.
  /// - Parameter amount: The other amount to subtract.
  public func subtracting(_ amount: some BinaryInteger) -> Self {
    return self - amount
  }

  public static func -(lhs: Self, rhs: Decimal) -> Self {
    return .init(exactAmount: lhs.exactAmount - rhs)
  }
  public static func -=(lhs: inout Self, rhs: Decimal) { lhs = lhs - rhs }

  /// Subtracts the given other amount from the current exactAmount.
  /// - Parameter amount: The other amount to subtract.
  public mutating func subtract(_ amount: Decimal) {
    self -= amount
  }
  /// Subtracts the other amount from the current exactAmount as a new value.
  /// - Parameter amount: The other amount to subtract.
  public func subtracting(_ amount: Decimal) -> Self {
    return self - amount
  }
}

//  MARK: Multiplication

extension Currency {
  // perhaps convert to minor units, multiply, then convert back to decimal?
  // let result = Double(lhs.minorUnits * rhs.minorUnits) / pow(10, Double(Self.metadata.minorUnits))

  public static func *(lhs: Self, rhs: some BinaryInteger) -> Self {
    guard let rhs = Decimal(exactly: rhs) else {
      return .init(exactAmount: .nan)
    }
    return .init(exactAmount: lhs.exactAmount * rhs)
  }
  public static func *=(lhs: inout Self, rhs: some BinaryInteger) { lhs = lhs * rhs }

  /// Multiplies the current exactAmount by the given other amount.
  /// - Parameter amount: The other amount to multiply by.
  public mutating func multiply(by amount: some BinaryInteger) {
    self *= amount
  }
  /// Multiplies the current exactAmount by the other amount as a new value.
  /// - Parameter amount: The other amount to multiply by.
  public func multiplying(by amount: some BinaryInteger) -> Self {
    return self * amount
  }

  public static func *(lhs: Self, rhs: Decimal) -> Self {
    return .init(exactAmount: lhs.exactAmount * rhs)
  }
  public static func *=(lhs: inout Self, rhs: Decimal) { lhs = lhs * rhs }

  /// Multiplies the current exactAmount by the given other amount.
  /// - Parameter amount: The other amount to multiply by.
  public mutating func multiply(by amount: Decimal) {
    self *= amount
  }
  /// Multiplies the current exactAmount by the other amount as a new value.
  /// - Parameter amount: The other amount to multiply by.
  public func multiplying(by amount: Decimal) -> Self {
    return self * amount
  }
}

// MARK: Division

extension Currency {
  // perhaps convert to minor units, multiply, then convert back to decimal?
  // let quotent = Double(lhs.minorUnits) / .init(rhs.minorUnits)
  // let result = quotent * pow(10, Double(Self.metadata.minorUnits))

  public static func /(lhs: Self, rhs: some BinaryInteger) -> Self {
    guard let rhs = Decimal(exactly: rhs) else {
      return .init(exactAmount: .nan)
    }
    return lhs / rhs
  }
  public static func /=(lhs: inout Self, rhs: some BinaryInteger) { lhs = lhs / rhs }

  @inlinable
  public mutating func divide(by amount: some BinaryInteger) {
    self /= amount
  }
  public func dividing(by amount: some BinaryInteger) -> Self {
    return self / amount
  }

  public static func /(lhs: Self, rhs: Decimal) -> Self {
    return .init(exactAmount: lhs.exactAmount / rhs)
  }
  public static func /=(lhs: inout Self, rhs: Decimal) { lhs = lhs / rhs }

  @inlinable
  public mutating func divide(by amount: Decimal) {
    self /= amount
  }
  public func dividing(by amount: Decimal) -> Self {
    return self / amount
  }
}
