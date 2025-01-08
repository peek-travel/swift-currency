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

// MARK: CurrencyIdentifier

extension CurrencyMint {
  /// An identifier of a currency.
  ///
  /// Numeric codes are normally between 0-999 in value.
  ///
  /// Alphabetic codes are normally 3 Latin characters, and will be normalized to all capital letters.
  public enum CurrencyIdentifier: Equatable, ExpressibleByStringLiteral, ExpressibleByIntegerLiteral {
    case alphaCode(String), numericCode(UInt16)

    /// Creates an identifier to represent the alphabetic code.
    /// - Parameter value: The alphabetic code identifier.
    public init(_ value: String) { self = .alphaCode(value.uppercased()) }

    /// Creates an identifier to represent the numeric code.
    /// - Parameter value: The numeric code identifier.
    public init(_ value: UInt16) { self = .numericCode(value) }

    public init(stringLiteral value: String) { self.init(value) }
    public init(integerLiteral value: UInt16) { self.init(value) }

    public static func ==(lhs: CurrencyIdentifier, rhs: CurrencyIdentifier) -> Bool {
      switch (lhs, rhs) {
      case let (.alphaCode(lhsValue), .alphaCode(rhsValue)): return lhsValue == rhsValue
      case let (.numericCode(lhsValue), .numericCode(rhsValue)): return lhsValue == rhsValue
      default: return false
      }
    }
  }
}

// MARK: CurrencyMint

/// A factory object that supports creation instances of concrete currency types
/// by their alphabetic or numeric code identifiers.
public final class CurrencyMint {
  /// A closure that receives a currency identifier and finds a matching concrete currency type.
  public typealias IdentifierLookup = (CurrencyIdentifier) -> (any CurrencyValue.Type)?

  /// Returns a shared currency generator that only provides ISO 4217 defined currencies.
  public static var standard: CurrencyMint {
    return .init(fallbackLookup: { _ in nil })
  }

  private let fallbackLookup: IdentifierLookup

  /// Creates an instance that will use the provided lookup closure if an identifier doesn't match the ISO 4217 specification.
  /// - Parameter fallbackLookup: An escaping closure that will be invoked when a currency's identifier is not found in the ISO 4217 specification.
  public init(fallbackLookup: @escaping IdentifierLookup) {
    self.fallbackLookup = fallbackLookup
  }
}

// MARK: Custom Initializers

extension CurrencyMint {
  /// Creates an instance that will always resolves the provided currency type when ISO 4217 specification lookup fails.
  /// - Parameter defaultCurrency: The default currency type to provide when a currency's identifier is not found in the ISO 4217 specification.
  public convenience init(defaultCurrency: (some CurrencyValue).Type) {
    self.init(fallbackLookup: { _ in defaultCurrency })
  }
}

// MARK: Factory Methods

extension CurrencyMint {
  /// Creates a currency value for the provided identifier.
  /// - Parameters:
  ///   - identifier: The identifier of the currency to be created.
  ///   - minorUnits: The quantity of minor units the currency value should represent. The default is `0`.
  /// - Returns: An instance of a currency that matches the provided identifier with the desired amount; otherwise `nil`.
  public func make(identifier: CurrencyIdentifier, minorUnits value: Int64 = .zero) -> (any CurrencyValue)? {
    guard let currencyType = self.lookup(identifier) else { return nil }
    return currencyType.init(minorUnits: value)
  }

  /// Creates a currency value for the provided identifier.
  /// - Parameters:
  ///   - identifier: The identifier of the currency to be created.
  ///   - value: The amount the currency value should represent.
  /// - Returns: An instance of a currency that matches the provided identifier with the desired amount; otherwise `nil`.
  public func make(identifier: CurrencyIdentifier, exactAmount value: Decimal) -> (any CurrencyValue)? {
    guard let currencyType = self.lookup(identifier) else { return nil }
    return currencyType.init(exactAmount: value)
  }

  private func lookup(_ identifier: CurrencyIdentifier) -> (any CurrencyValue.Type)? {
    var typeFound: (any CurrencyValue.Type)? = nil
    switch identifier {
    case let .alphaCode(value): typeFound = CurrencyMint.lookup(byAlphaCode: value)
    case let .numericCode(value): typeFound = CurrencyMint.lookup(byNumCode: value)
    }
    return typeFound ?? self.fallbackLookup(identifier)
  }
}
