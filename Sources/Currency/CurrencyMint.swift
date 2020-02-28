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

/// A generator object that supports creation of type-safe currencies by their alphabetic or numeric code identifiers.
///
/// By default, the generator only references the ISO 4217 specification of identifiers to determine which currency type to create.
///
///     let usd = CurrencyMint.standard.make(identifier: "USD", amount: 30.23)
///     print(usd)
///     // USD(30.23)
///
/// If it's desired to support currencies not found in the supported ISO 4217 specification,
/// a closure that will be referenced as a fallback can be provided at initialization:
///
///     let mint = CurrencyMint(fallbackLookup: { identifier in
///       guard identifier == .alphaCode("KED") else { return USD.self /* or nil */ }
///       return KED.self // the custom currency type
///     }
///     let ked = mint.make(identifier: "KED")
///     let unknownCurrency = mint.make(identifier: 666)
///     print(ked, unknownCurrency)
///     // KED(0), USD(0)
///
/// In most cases, it's desired to just provide a single fallback currency when type lookup fails:
///
///     let mint = CurrencyMint(defaultCurrency: USD.self)
///     let value = mint.make(identifier: "_SL", amount: 300)
///     print(value)
///     // USD(300)
///
/// See [ISO 4217](https://www.iso.org/iso-4217-currency-codes.html)
public final class CurrencyMint {
  /// A closure that receives a currency identifier and finds a matching concrete currency type.
  public typealias IdentifierLookup = (CurrencyIdentifier) -> AnyCurrency.Type?

  /// Returns a shared currency generator that only provides ISO 4217 defined currencies.
  public static var standard: CurrencyMint { return .init() }

  private init() {
    self.fallbackLookup = { _ in return nil }
  }

  /// Creates an instance that will use the provided lookup closure if an identifier doesn't match the ISO 4217 specification.
  /// - Parameter fallbackLookup: An escaping closure that will be invoked when a currency's identifier is not found in the ISO 4217 specification.
  public init(fallbackLookup: @escaping IdentifierLookup) {
    self.fallbackLookup = fallbackLookup
  }

  /// Creates an instance that will always resolves the provided currency type when ISO 4217 specification lookup fails.
  /// - Parameter defaultCurrency: The default currency type to provide when a currency's identifier is not found in the ISO 4217 specification.
  public init<T: CurrencyProtocol>(defaultCurrency: T.Type) {
    self.fallbackLookup = { _ in return defaultCurrency }
  }

  private let fallbackLookup: IdentifierLookup
}

// MARK: Factory Methods

extension CurrencyMint {
  /// Creates a currency value for the provided identifier.
  /// - Parameters:
  ///   - identifier: The identifier of the currency to be created.
  ///   - minorUnits: The quantity of minor units the currency value should represent. The default is `0`.
  /// - Returns: An instance of a currency that matches the provided identifier with the desired amount; otherwise `nil`.
  public func make(identifier: CurrencyIdentifier, minorUnits value: Int64 = .zero) -> AnyCurrency? {
    guard let currencyType = self.lookup(identifier) else { return nil }
    return currencyType.init(minorUnits: value)
  }

  /// Creates a currency value for the provided identifier.
  /// - Parameters:
  ///   - identifier: The identifier of the currency to be created.
  ///   - amount: The amount the currency value should represent.
  /// - Returns: An instance of a currency that matches the provided identifier with the desired amount; otherwise `nil`.
  public func make(identifier: CurrencyIdentifier, amount value: Decimal) -> AnyCurrency? {
    guard let currencyType = self.lookup(identifier) else { return nil }
    return currencyType.init(amount: value)
  }

  private func lookup(_ identifier: CurrencyIdentifier) -> AnyCurrency.Type? {
    var typeFound: AnyCurrency.Type? = nil
    switch identifier {
    case let .alphaCode(value): typeFound = CurrencyMint.lookup(byAlphaCode: value)
    case let .numericCode(value): typeFound = CurrencyMint.lookup(byNumCode: value)
    }
    return typeFound ?? self.fallbackLookup(identifier)
  }
}
