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
{ }
