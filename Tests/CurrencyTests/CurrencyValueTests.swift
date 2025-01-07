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

final class CurrencyValueTests: XCTestCase { }

// MARK: Initialization

extension CurrencyValueTests {
  func test_init_exactAmount_doesNotModifyValue() {
    func assertInit(amount: Decimal, for currencyType: (some CurrencyValue).Type, file: StaticString = #file, line: UInt = #line) {
      XCTAssertEqual(
        currencyType.init(exactAmount: amount).exactAmount,
        amount,
        file: file, line: line
      )
    }

    assertInit(amount: 30.23, for: USD.self)
    assertInit(amount: -208.001, for: USD.self)
    assertInit(amount: .nan, for: USD.self)

    assertInit(amount: 100.23, for: JPY.self)
    assertInit(amount: -39820, for: JPY.self)
    assertInit(amount: .nan, for: JPY.self)

    assertInit(amount: 02838.29708, for: KWD.self)
    assertInit(amount: -300.87, for: KWD.self)
    assertInit(amount: .nan, for: KWD.self)
  }

  func test_init_minorUnits_correctlyConvertsToDecimal() {
    XCTAssertEqual(USD(minorUnits: 100), USD(exactAmount: 1.0))
    XCTAssertEqual(USD(minorUnits: 101), USD(exactAmount: 1.01))
    XCTAssertEqual(USD(minorUnits: 50011), USD(exactAmount: 500.11))
  }
}

// MARK: Minor Units Representation

extension CurrencyValueTests {
  func test_0MinorUnits_representationIsCorrect() {
    XCTAssertEqual(JPY.zero.minorUnits, .zero)
    XCTAssertEqual(JPY(exactAmount: 10.01).minorUnits, 10)
    XCTAssertEqual(JPY(exactAmount: 100).minorUnits, 100)
  }

  func test_1MinorUnits_representationIsCorrect() {
    XCTAssertEqual(XTS.zero.minorUnits, .zero)
    XCTAssertEqual(XTS(exactAmount: 10.01).minorUnits, 100)
    XCTAssertEqual(XTS(exactAmount: 100).minorUnits, 1000)
  }

  func test_2MinorUnits_representationIsCorrect() {
    XCTAssertEqual(USD.zero.minorUnits, .zero)
    XCTAssertEqual(USD(exactAmount: 10.01).minorUnits, 1001)
    XCTAssertEqual(USD(exactAmount: 100).minorUnits, 10000)
  }

  func test_3MinorUnits_representationIsCorrect() {
    XCTAssertEqual(KWD.zero.minorUnits, .zero)
    XCTAssertEqual(KWD(exactAmount: 10.01).minorUnits, 10010)
    XCTAssertEqual(KWD(exactAmount: 100).minorUnits, 100000)
  }
}

// MARK: Equatable, Hashable, Comparable

extension CurrencyValueTests {
  struct TestCurrency: CurrencyValue, CurrencyDescriptor {
    static var name: String = "TestCurrency"
    static var alphabeticCode: String = "TC"
    static var numericCode: UInt16 = .max
    static var minorUnits: UInt8 = 2

    let exactAmount: Decimal
  }

  func test_equatable_whenDifferentDescriptors_isFalse() {
    XCTAssertFalse(USD(exactAmount: .nan) == TestCurrency(exactAmount: .nan))
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

  func test_comparable_whenSameDescriptors_comparesExactAmount() {
    XCTAssertTrue(TestCurrency(exactAmount: 30) < TestCurrency(exactAmount: 30.01))
  }

  func test_hashable_whenDifferentDescriptors_hasDifferentHashValues() {
    let first = self._hash_currency(TestCurrency(exactAmount: 30))
    let second = self._hash_currency(USD(exactAmount: 30))

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

  private func _hash_currency(_ currency: some CurrencyValue) -> Int {
    var hasher = Hasher()
    hasher.combine(currency)
    return hasher.finalize()
  }
}

// MARK: Example Usage

extension CurrencyValueTests {
  func test_existential_mathCompiles() {
    let value: any CurrencyValue = USD(minorUnits: 300)

    XCTAssertTrue(value is USD)
    XCTAssertEqual(value.adding(3.5).exactAmount, 6.5)
  }

  func test_existential_isImplicitlyOpened() {
    func someGenericContext(_ value: some CurrencyValue) -> Bool {
      return value is USD
    }
    func someOtherGenericContext<Currency: CurrencyValue>(_ value: Currency) -> Currency {
      return value + 3.5
    }

    let value: any CurrencyValue = USD.zero
    XCTAssertTrue(someGenericContext(value))
    XCTAssertEqual(someOtherGenericContext(value).exactAmount, 3.5)
  }
}
