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

/// A wrapper around an `AnyCurrency` existential.
///
/// An `OpaqueCurrency` is to be used to represent `AnyCurrency` existentials in generic contexts, where protocol self-conformance
/// is required.
///
/// e.g. You have an `AnyCurrency` existential that you want to pass to a generic method that accepts `T: AnyCurrency`.
/// - Important: Initializing an `OpaqueCurrency` using any initializer other than `init(wrapping:)` is an illegal operation.
public struct OpaqueCurrency: AnyCurrency,
  Comparable, Hashable,
  CustomStringConvertible
{
  public var metadata: CurrencyMetadata.Type { return self.value.metadata }
  public var minorUnits: Int64 { return self.value.minorUnits }
  
  internal var wrappedType: AnyCurrency.Type { return type(of: self.value) }
  
  internal let value: AnyCurrency
  
  public init(exactly minorUnits: Int64) {
    preconditionFailure("\(Self.self).\(#function) should never be called directly.")
  }
  
  public init(_ amount: Decimal) {
    preconditionFailure("\(Self.self).\(#function) should never be called directly.")
  }
  
  /// Creates an `OpaqueCurrency` from a given value.
  /// - Parameter value: The currency value to make wrap.
  public init(wrapping value: AnyCurrency) { self.value = value }
  
  /// Creates an `OpaqueCurrency` from a given value, if present.
  /// - Parameter value: The potential currency value to make wrap.
  public init?(wrapping value: AnyCurrency?) {
    guard let value = value else { return nil }
    self.init(wrapping: value)
  }
}

// MARK: Specialized Arithmetic

extension OpaqueCurrency {
  public static func +(lhs: Self, rhs: Self) -> Self {
    precondition(lhs.metadata == rhs.metadata, "Cannot use two different wrapped currencies!")
    let value = lhs.wrappedType.init(exactly: lhs.minorUnits + rhs.minorUnits)
    return .init(wrapping: value)
  }
  
  public static func -(lhs: Self, rhs: Self) -> Self {
    precondition(lhs.metadata == rhs.metadata, "Cannot use two different wrapped currencies!")
    let value = lhs.wrappedType.init(exactly: lhs.minorUnits - rhs.minorUnits)
    return .init(wrapping: value)
  }
  
  public static func *(lhs: Self, rhs: Self) -> Self {
    precondition(lhs.metadata == rhs.metadata, "Cannot use two different wrapped currencies!")
    let value = lhs.wrappedType.init(lhs.amount * rhs.amount)
    return .init(wrapping: value)
  }
  
  public static func /(lhs: Self, rhs: Self) -> Self {
    precondition(lhs.metadata == rhs.metadata, "Cannot use two different wrapped currencies!")
    let value = lhs.wrappedType.init(lhs.amount / rhs.amount)
    return .init(wrapping: value)
  }
}
