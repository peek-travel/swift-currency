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

import Currency
import XCTest

final class SequenceCurrencyTests: XCTestCase { }

// MARK: Sum

extension SequenceCurrencyTests {
  func test_sum() {
    let amounts: [USD] = [304.98, 19.02]
    let sumTotal = amounts.sum()
    XCTAssertEqual(sumTotal.roundedAmount, 324)
  }

  func test_sum_withWhereClause() {
    let amounts: [USD] = [304.98, 9.02, 30.21]
    let sumTotal = amounts.sum(where: { $0.exactAmount > 20 })
    XCTAssertEqual(sumTotal.roundedAmount, 335.19)
  }

  func test_sum_withMap() {
    let prices: [USD] = [3, 2.99, 5.98]
    let totalTaxes = prices.sum { $0 * Decimal(0.09) }
    XCTAssertEqual(totalTaxes.roundedAmount, 1.08)
  }
}
