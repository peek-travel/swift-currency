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

final class CurrencyTests: XCTestCase { }

// MARK: Initialization

extension CurrencyTests {
  func test_init_exactAmount_doesNotModifyValue() {
    func assertInit(amount: Decimal, for currencyType: (some Currency).Type, file: StaticString = #file, line: UInt = #line) {
      XCTAssertEqual(
        currencyType.init(exactAmount: amount).exactAmount,
        amount,
        file: file, line: line
      )
    }

    assertInit(amount: 30.23, for: _New_USD.self)
    assertInit(amount: -208.001, for: _New_USD.self)
    assertInit(amount: .nan, for: _New_USD.self)

    assertInit(amount: 100.23, for: _New_JPY.self)
    assertInit(amount: -39820, for: _New_JPY.self)
    assertInit(amount: .nan, for: _New_JPY.self)

    assertInit(amount: 02838.29708, for: _New_KWD.self)
    assertInit(amount: -300.87, for: _New_KWD.self)
    assertInit(amount: .nan, for: _New_KWD.self)
  }

  func test_init_minorUnits_correctlyConvertsToDecimal() {
    XCTAssertEqual(_New_USD(minorUnits: 100), _New_USD(exactAmount: 1.0))
    XCTAssertEqual(_New_USD(minorUnits: 101), _New_USD(exactAmount: 1.01))
    XCTAssertEqual(_New_USD(minorUnits: 50011), _New_USD(exactAmount: 500.11))
  }
}

// MARK: Minor Units Representation

extension CurrencyTests {
  func test_0MinorUnits_representationIsCorrect() {
    XCTAssertEqual(_New_JPY.zero.minorUnits, .zero)
    XCTAssertEqual(_New_JPY(exactAmount: 10.01).minorUnits, 10)
    XCTAssertEqual(_New_JPY(exactAmount: 100).minorUnits, 100)
  }

  func test_1MinorUnits_representationIsCorrect() {
    XCTAssertEqual(_New_XTS.zero.minorUnits, .zero)
    XCTAssertEqual(_New_XTS(exactAmount: 10.01).minorUnits, 100)
    XCTAssertEqual(_New_XTS(exactAmount: 100).minorUnits, 1000)
  }

  func test_2MinorUnits_representationIsCorrect() {
    XCTAssertEqual(_New_USD.zero.minorUnits, .zero)
    XCTAssertEqual(_New_USD(exactAmount: 10.01).minorUnits, 1001)
    XCTAssertEqual(_New_USD(exactAmount: 100).minorUnits, 10000)
  }

  func test_3MinorUnits_representationIsCorrect() {
    XCTAssertEqual(_New_KWD.zero.minorUnits, .zero)
    XCTAssertEqual(_New_KWD(exactAmount: 10.01).minorUnits, 10010)
    XCTAssertEqual(_New_KWD(exactAmount: 100).minorUnits, 100000)
  }
}

// MARK: Equatable, Hashable, Comparable

extension CurrencyTests {
  struct TestCurrency: Currency, CurrencyDescriptor {
    static var name: String = "TestCurrency"
    static var alphabeticCode: String = "TC"
    static var numericCode: UInt16 = .max
    static var minorUnits: UInt8 = 2

    let exactAmount: Decimal
  }

  func test_equatable_whenDifferentDescriptors_isFalse() {
    XCTAssertFalse(_New_USD(exactAmount: .nan) == TestCurrency(exactAmount: .nan))
  }

  func test_equatable_whenSameDescriptors_andSameExactAmount_isTrue() {
    XCTAssertTrue(TestCurrency(exactAmount: .nan) == TestCurrency(exactAmount: .nan))
  }

  func test_equatable_whenSameDescriptors_andDifferentExactAmount_isFalse() {
    XCTAssertFalse(TestCurrency(exactAmount: .nan) == TestCurrency(exactAmount: .zero))
    XCTAssertFalse(TestCurrency(exactAmount: 30.01) == TestCurrency(exactAmount: 30.001))
    XCTAssertFalse(TestCurrency(exactAmount: 30.01) == TestCurrency(exactAmount: 30.012))
    XCTAssertFalse(TestCurrency(exactAmount: 30.01) == TestCurrency(exactAmount: 30.019))
  }

  func test_comparable_whenDifferentDescriptors_comparesDescriptorPrimaryCode() {
    XCTAssertTrue(TestCurrency(exactAmount: 30) < _New_USD(exactAmount: 30))
    XCTAssertTrue(_New_KWD(exactAmount: 30) < TestCurrency(exactAmount: 30))
  }

  func test_comparable_whenSameDescriptors_comparesExactAmount() {
    XCTAssertTrue(TestCurrency(exactAmount: 30) < TestCurrency(exactAmount: 30.01))
  }

  func test_hashable_whenDifferentDescriptors_hasDifferentHashValues() {
    let first = self._hash_currency(TestCurrency(exactAmount: 30))
    let second = self._hash_currency(_New_USD(exactAmount: 30))

    XCTAssertNotEqual(first, second)
  }

  func test_hashable_whenSameDescriptors_andSameExactAmount_hasSameHashValues() {
    let first = self._hash_currency(TestCurrency(exactAmount: 30))
    let second = self._hash_currency(TestCurrency(exactAmount: 30))

    XCTAssertEqual(first, second)
  }

  func test_hashable_whenSameDescriptors_andDifferentExactAmount_hasDifferentHasValues() {
    let first = self._hash_currency(TestCurrency(exactAmount: 30))
    let second = self._hash_currency(TestCurrency(exactAmount: 30.01))

    XCTAssertNotEqual(first, second)
  }

  private func _hash_currency(_ currency: some Currency) -> Int {
    var hasher = Hasher()
    hasher.combine(currency)
    return hasher.finalize()
  }
}

// MARK: Example Usage
