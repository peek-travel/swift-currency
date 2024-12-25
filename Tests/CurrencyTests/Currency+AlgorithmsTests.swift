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

final class CurrencyAlgorithmsTests: XCTestCase { }

// MARK: Distributed Evenly

extension CurrencyAlgorithmsTests {
  func test_distributedEvenly_with0_orNegative_NumParts_returnsEmptyResult() {
    let value = _New_USD(5)
    XCTAssertTrue(value.distributedEvenly(intoParts: 0).isEmpty)
    XCTAssertTrue(value.distributedEvenly(intoParts: -1).isEmpty)
  }

  func test_distributedEvenly_with0MinorUnits() {
    self.run_distributedEvenlyTest(
      for: _New_JPY(10.05),
      numParts: 6,
      expectedResults: .init(repeating: _New_JPY(2), count: 4) + .init(repeating: _New_JPY(1), count: 2)
    )
  }

  func test_distributedEvenly_with1MinorUnit() {
    self.run_distributedEvenlyTest(
      for: _New_XTS(10.05),
      numParts: 6,
      expectedResults: .init(repeating: _New_XTS(1.7), count: 4) + .init(repeating: _New_XTS(1.6), count: 2)
    )
  }

  func test_distributedEvenly_with2MinorUnit() {
    self.run_distributedEvenlyTest(
      for: _New_USD(15.01),
      numParts: 3,
      expectedResults: [_New_USD(exactAmount: Decimal(string: "5.01")!), 5, 5]
    )
    self.run_distributedEvenlyTest(
      for: _New_USD(10.05),
      numParts: 6,
      expectedResults: .init(repeating: _New_USD(1.68), count: 3) + .init(repeating: _New_USD(1.67), count: 3)
    )
  }

  func test_distributedEvenly_with3MinorUnit() {
    self.run_distributedEvenlyTest(
      for: _New_KWD(10.05),
      numParts: 6,
      expectedResults: .init(repeating: _New_KWD(1.675), count: 6)
    )
  }

  private func run_distributedEvenlyTest<C: Currency>(
    for currency: C,
    numParts count: Int,
    expectedResults: [C],
    file: StaticString = #file,
    line: UInt = #line
  ) {
    guard count == expectedResults.count else {
      return XCTFail(
        "Inconsistent desire: Asked for \(count) parts, but expect \(expectedResults.count) results",
        file: file, line: line
      )
    }
    let actualResults = currency.distributedEvenly(intoParts: count)
    XCTAssertEqual(actualResults, expectedResults, file: file, line: line)
    XCTAssertEqual(currency.roundedAmount, expectedResults.sum().roundedAmount, file: file, line: line)
    XCTAssertEqual(
      currency.negated().distributedEvenly(intoParts: count),
      expectedResults.map({ $0.negated() }),
      file: file, line: line
    )
  }
}
