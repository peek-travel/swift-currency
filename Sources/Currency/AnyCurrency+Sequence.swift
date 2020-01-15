//===----------------------------------------------------------------------===//
//
// This source file is part of the Currency open source project
//
// Copyright (c) 2020 Currency project authors
// Licensed under MIT License
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of Currency project authors
//
// SPDX-License-Identifier: MIT
//
//===----------------------------------------------------------------------===//

import Foundation

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
    return self.reduce(into: .init(.zero), { $0 += $1 })
  }
  
  /// Returns the sum total of all amounts in the sequence that satify the given predicate.
  /// For example:
  ///
  ///     let amounts: [USD] = [304.98, 19.02, 30.21]
  ///     let sumTotal = amounts.sum(where: { $0.roundedAmount > 20 })
  ///     print(sumTotal)
  ///     // prints "335.19"
  ///
  /// - Complexity: O(*n*), where *n* is the length of the sequence.
  /// - Parameter predicate: A closure that takes a currency element as its argument
  ///   and returns a Boolean value that indicates whether the passed element should be included in the sum.
  /// - Returns:A currency value representing the sum total of all the amounts in the sequence that satisfies `predicate`.
  public func sum(where predicate: (Element) throws -> Bool) rethrows -> Element {
    return try self.filter(predicate).sum()
  }
}
