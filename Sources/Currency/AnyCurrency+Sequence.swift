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

// MARK: Sum

extension Sequence where Element: AnyCurrency {
  /// Returns the sum total of all amounts in the sequence.
  ///
  /// For example:
  ///
  ///     let amounts: [USD] = [304.98, 19.02]
  ///     let sumTotal = amounts.sum()
  ///     print(sumTotal)
  ///     // prints "324"
  ///
  /// If the sequence has no elements, you will receive a currency with a value of "0".
  /// - Complexity: O(*n*) , where *n* is the length of the sequence.
  /// - Returns: A currency value representing the sum total of all the amounts in the sequence.
  public func sum() -> Element {
    return self.reduce(into: .zero, +=)
  }

  /// Returns the sum total of all amounts in the sequence that satify the given predicate.
  /// For example:
  ///
  ///     let amounts: [USD] = [304.98, 19.02, 30.21]
  ///     let sumTotal = amounts.sum(where: { $0.amount > 20 })
  ///     print(sumTotal)
  ///     // prints "335.19"
  ///
  /// - Complexity: O(*n*), where *n* is the length of the sequence.
  /// - Parameter isIncluded: A closure that takes a currency element as its argument
  ///   and returns a Boolean value that indicates whether the passed element should be included in the sum.
  /// - Returns: A currency value representing the sum total of all the amounts `isIncluded` allowed.
  @inlinable
  public func sum(where isIncluded: (Element) throws -> Bool) rethrows -> Element {
    return try self.reduce(into: .zero) { result, next in
      guard try isIncluded(next) else { return }
      result += next
    }
  }

  /// Returns the sum total of amounts in the sequence after applying the provided transform.
  ///
  /// Rather than doing a `.map(_:)` and then `.sum()`, the `sum` result will be calculated inline while applying the transformations.
  ///
  /// For example, you may want to calculate what the total taxes would be from a sequence of individual prices:
  ///
  ///     let prices: [USD] = [3.00, 2.99, 5.98]
  ///     // apply a 9% tax rate to each price and calculate the sum
  ///     let totalTaxes = prices.sum { $0 * Decimal(0.09) }
  ///     // totalTaxes == USD(1.08)
  ///
  /// - Complexity: O(*n*), where *n* is the length of the sequence.
  /// - Parameter transform: A mapping closure. `transform` accepts an element of this sequence as its parameter
  /// and returns a transformed value of the same type.
  /// - Returns: A currency value representing the sum total of all the transformed amounts in the sequence.
  @inlinable
  public func sum(_ transform: (Element) throws -> (Element)) rethrows -> Element {
    return try self.reduce(into: .zero) { $0 += try transform($1) }
  }
}
