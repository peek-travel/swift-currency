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

/// The integer used to represent a currency in it's 'minor units' form.
/// e.g. 100 USD will be represented as `100`.
///
/// Converting from minor units to its decimal form is lossless, as you can multiply or divide
/// by the currency's `minorUnits` value.
public typealias CurrencyMinorUnitRepresentation = Int64
