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

/// A wrapper around an `AnyCurrency` existential.
///
/// An `OpaqueCurrency` is to be used to represent `AnyCurrency` existentials in generic contexts, where protocol self-conformance
/// is required.
///
/// e.g. You have an `AnyCurrency` existential that you want to pass to a generic method that accepts `T: AnyCurrency`.
/// - Important: Initializing an `OpaqueCurrency` using any initializer other than `init(wrapping:)` is an illegal operation.
public struct OpaqueCurrency: CurrencyProtocol {
  public var metadata: CurrencyMetadata.Type { return self.value.metadata }
  public var minorUnits: Int64 { return self.value.minorUnits }
  
  private let value: AnyCurrency
  
  public init(exactly minorUnits: Int64) {
    preconditionFailure("\(Self.self).init(exactly:) should never be called directly.")
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
