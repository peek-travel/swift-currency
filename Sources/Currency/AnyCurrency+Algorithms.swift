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

// MARK: Value Distribution

extension AnyCurrency {
  /// Distributes the current amount into a set number of parts as evenly as possible.
  /// - Note: Passing a negative or `0` value will result in an empty result.
  /// - Complexity: O(*n*), where *n* is the `numParts`.
  /// - Parameter numParts: The count of new values the single value should be distributed between as evenly as possible.
  /// - Returns: A collection of currency values with their share of the amount distribution.
  public func distributedEvenly(intoParts numParts: Int) -> [Self] {
    guard numParts > 0 else { return [] }

    let count = Int64(numParts)
    
    // courtesy of https://codereview.stackexchange.com/a/221221
    let units = self.minorUnits
    let fraction = units / count
    let remainder = Int(abs(units) % count)
    
    var results: [Self] = .init(repeating: .zero, count: numParts)
    for index in 0..<remainder {
      results[index] = Self(minorUnits: fraction + units.signum())
    }
    for index in remainder..<numParts {
      results[index] = Self(minorUnits: fraction)
    }
    
    return results
  }
  
  /// Distributes the current amount between other amounts proportionally based on their original value.
  ///
  /// The resulting amounts will match the same sign (negative or positive) as the amount being distributed.
  ///
  /// For example:
  ///
  ///     let result = USD(-10).distributedProportionally(between: [5, 8.25])
  ///     // result == [USD(-3.77), USD(-6.23)]
  ///
  /// - Note: In situations where all `originalValues` are equal, the amount will not be evenly distributed. The remainder will be biased towards the last
  /// element in the `originalValues`.
  ///
  /// For example:
  ///
  ///      let result = USD(10.05).distributedProportionally(between: [1, 1, 1, 1, 1, 1])
  ///      // result == [USD(1.67), USD(1.67), USD(1.67), USD(1.67), USD(1.67), USD(1.70)]
  ///
  /// In this case, it is more appropriate to call `distributedEvenly(intoParts:)`.
  ///
  /// - Complexity: O(*n*), where *n* is the number of `originalValues`.
  /// - Parameter originalValues: A collection of values that should be scaled proportionally so that their sum equals this currency's amount.
  /// - Returns: A collection of currency values that are scaled proportionally from an original value whose sum equals this currency's amount.
  public func distributedProportionally<T>(
    between originalValues: T
  ) -> [Self]
    where T: Collection, T.Element == Self
  {
    guard originalValues.count > 0 else { return [] }
    
    var results: [Self] = .init(repeating: .zero, count: originalValues.count)
    
    let desiredTotalUnits = self.minorUnits
    guard desiredTotalUnits != 0 else { return results }
    
    let originalTotalUnits = originalValues.sum().minorUnits

    var currentTotalUnits: Int64 = 0
    var index = 0
    for value in originalValues.dropLast() {
      defer { index += 1 }

      let proportion = Decimal(value.minorUnits) / .init(originalTotalUnits)
      let newValue = Self(scalingAndRounding: self.amount * proportion)

      defer { currentTotalUnits += newValue.minorUnits }

      results[index] = newValue
    }

    results[originalValues.count - 1] = Self(minorUnits: desiredTotalUnits - currentTotalUnits)
    
    return results
  }
}
