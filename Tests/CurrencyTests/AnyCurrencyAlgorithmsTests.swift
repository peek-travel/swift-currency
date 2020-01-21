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

import Currency
import XCTest

public final class AnyCurrencyAlgorithmsTests: XCTestCase { }

// MARK: Distributed Evenly

extension AnyCurrencyAlgorithmsTests {
  func test_distributedEvenly() {
    let amount = USD(15.01)
    XCTAssertEqual(amount.distributedEvenly(intoParts: 3), [5.01, 5, 5])
    XCTAssertEqual(amount.distributedEvenly(intoParts: 0), [])
    XCTAssertEqual(amount.distributedEvenly(intoParts: -1), [])
    XCTAssertEqual(amount.inverseAmount.distributedEvenly(intoParts: 4), [-3.76, -3.75, -3.75, -3.75])
  }

  // minorUnits == 2
  func test_distributedEvenly_usd() {
    self.run_distributedEvenlyTest(
      sourceAmount: USD(10.05),
      numParts: 6,
      expectedResults: .init(repeating: USD(1.68), count: 3) + .init(repeating: USD(1.67), count: 3)
    )
  }
  
  // minorUnits == 3
  func test_distributedEvenly_bhd() {
    self.run_distributedEvenlyTest(
      sourceAmount: BHD(180),
      numParts: 7,
      expectedResults: .init(repeating: BHD(25.715), count: 2) + .init(repeating: BHD(25.714), count: 5)
    )
    self.run_distributedEvenlyTest(
      sourceAmount: BHD(10.1983),
      numParts: 3,
      expectedResults: [BHD(3.4)] + .init(repeating: BHD(3.399), count: 2)
    )
  }
  
  /// minorUnits == 0
  func test_distributedEvenly_bif() {
    self.run_distributedEvenlyTest(
      sourceAmount: BIF(298),
      numParts: 3,
      expectedResults: [100] + .init(repeating: BIF(99), count: 2)
    )
    self.run_distributedEvenlyTest(
      sourceAmount: BIF(157.982),
      numParts: 9,
      expectedResults: .init(repeating: BIF(18), count: 5) + .init(repeating: BIF(17), count: 4)
    )
  }
  
  private func run_distributedEvenlyTest<Currency: AnyCurrency & Equatable>(
    sourceAmount: Currency,
    numParts count: Int,
    expectedResults: [Currency]
  ) {
    guard count == expectedResults.count else {
      return XCTFail("Inconsistent desire: Asked for \(count) parts, but expect \(expectedResults.count) results")
    }
    let actualResults = sourceAmount.distributedEvenly(intoParts: count)
    XCTAssertEqual(actualResults, expectedResults)
    XCTAssertEqual(sourceAmount, expectedResults.sum())
    XCTAssertEqual(
      sourceAmount.inverseAmount.distributedEvenly(intoParts: count),
      expectedResults.map({ $0.inverseAmount })
    )
  }
}

// MARK: Distributed Proportionally

extension AnyCurrencyAlgorithmsTests {
  func test_distributedProportionally() {
    let amount = USD(10)
    XCTAssertEqual(amount.distributedProportionally(between: [2.5, 2.5]), [5, 5])
    XCTAssertEqual(amount.distributedProportionally(between: []), [])
    XCTAssertEqual(amount.inverseAmount.distributedProportionally(between: [5, 8.25]), [-3.77, -6.23])
  }
  
  // minorUnits == 2
  func test_distributedProportionally_usd() {
    self.run_distributedProportionallyTest(
      sourceAmount: USD(10.05),
      originalValues: .init(repeating: USD(1), count: 6),
      expectedValues: .init(repeating: USD(1.67), count: 5) + [USD(1.7)]
    )
    
    let sourceValues: [USD] = [4, 103, 0.99, 68, 100] // 275.99 USD
    self.run_distributedProportionallyTest(
      sourceAmount: .init(201.385),
      originalValues: sourceValues,
      expectedValues: [2.92, 75.16, 0.72, 49.62, 72.96]
    )
    self.run_distributedProportionallyTest(
      sourceAmount: .init(583),
      originalValues: sourceValues,
      expectedValues: [8.45, 217.58, 2.09, 143.64, 211.24]
    )
  }
  
  // minorUnits == 3
  func test_distributedProportionally_bhd() {
    let sourceValues: [BHD] = [4.1982, 39.2983, 12.1345, 17.293, 100] // 172.924 BHD
    self.run_distributedProportionallyTest(
      sourceAmount: .init(180),
      originalValues: sourceValues,
      expectedValues: [4.37, 40.906, 12.631, 18.001, 104.092]
    )
    self.run_distributedProportionallyTest(
      sourceAmount: .init(10.1983),
      originalValues: sourceValues,
      expectedValues: [0.248, 2.318, 0.716, 1.02, 5.896]
    )
  }
  
  // minorUnits == 0
  func test_distributedProportionally_bif() {
    let sourceValues: [BIF] = [4, 39, 12, 1, 100.2983] // 156 BIF
    self.run_distributedProportionallyTest(
      sourceAmount: .init(298),
      originalValues: sourceValues,
      expectedValues: [8, 74, 23, 2, 191]
    )
    self.run_distributedProportionallyTest(
      sourceAmount: .init(47.582),
      originalValues: sourceValues,
      expectedValues: [1, 12, 4, 0, 31]
    )
  }
  
  private func run_distributedProportionallyTest<Currency: AnyCurrency & Equatable>(
    sourceAmount: Currency,
    originalValues: [Currency],
    expectedValues: [Currency]
  ) {
    guard originalValues.count == expectedValues.count else {
      return XCTFail("Inconsistent desire: Provided \(originalValues.count) values, but expect \(expectedValues.count) results")
    }
    let actualResults = sourceAmount.distributedProportionally(between: originalValues)
    XCTAssertEqual(actualResults, expectedValues)
    XCTAssertEqual(sourceAmount, actualResults.sum())
  }
}
