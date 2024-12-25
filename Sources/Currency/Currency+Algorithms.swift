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

// MARK: Even Distribution

extension Currency {
  /// Distributes the current amount into a set number of parts as evenly as possible.
  ///
  /// After splitting the amount evenly, any remainder will be given to the first value in the result collection.
  /// - Note: Passing a negative or `0` value will result in an empty result.
  /// - Complexity: O(1)
  /// - Parameter numParts: The count of new values the single value should be distributed between as evenly as possible.
  /// - Returns: A collection of currency values with their share of the amount distribution.
  public func distributedEvenly(intoParts numParts: Int) -> [Self] {
    guard numParts > 0 else { return [] }

    let count = CurrencyMinorUnitRepresentation(numParts)

    let units = self.minorUnits
    let fraction = units / count
    let remainder = Int(abs(units) % count)

    let remainderCollection: [Self] = .init(repeating: Self(minorUnits: fraction + units.signum()), count: remainder)
    let distributedCollection: [Self] = .init(repeating: Self(minorUnits: fraction), count: numParts - remainder)
    return remainderCollection + distributedCollection
  }
}
