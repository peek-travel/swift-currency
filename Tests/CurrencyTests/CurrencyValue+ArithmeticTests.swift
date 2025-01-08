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

final class CurrencyValueArithmeticTests: XCTestCase { }

// MARK: Identity

extension CurrencyValueArithmeticTests {
  func test_zero_equalsDecimalZero() {
    XCTAssertTrue(USD.zero.exactAmount == .zero)
    XCTAssertTrue(JPY.zero.exactAmount == .zero)
    XCTAssertTrue(KWD.zero.exactAmount == .zero)
  }

  func test_negated_correctlyInvertsValues() {
    func assertNegationIsCorrect(for currencyType: (some CurrencyValue).Type, file: StaticString = #file, line: UInt = #line) {
      let positive = currencyType.init(exactAmount: 30.03)
      XCTAssertEqual(
        positive.negated(),
        currencyType.init(exactAmount: -30.03),
        "positive to negative failed",
        file: file, line: line
      )

      let negative = currencyType.init(exactAmount: -41.21)
      XCTAssertEqual(
        negative.negated(),
        currencyType.init(exactAmount: 41.21),
        "negative to positive failed",
        file: file, line: line
      )
    }

    assertNegationIsCorrect(for: USD.self)
    assertNegationIsCorrect(for: JPY.self)
    assertNegationIsCorrect(for: KWD.self)
  }
}

// MARK: Addition

extension CurrencyValueArithmeticTests {
  func test_addition_withSelf_isCorrect() {
    func assertAdditionIsCorrect(for currencyType: (some CurrencyValue).Type, file: StaticString = #file, line: UInt = #line) {
      let first = currencyType.init(exactAmount: 300.12)
      XCTAssertEqual(
        first + currencyType.init(exactAmount: 30.01),
        currencyType.init(exactAmount: 330.13),
        "operator failed",
        file: file, line: line
      )

      let second = currencyType.init(exactAmount: 32.12)
      XCTAssertEqual(
        second.adding(.init(exactAmount: 45)),
        currencyType.init(exactAmount: 77.12),
        "adding(_:) failed",
        file: file, line: line
      )

      var third = second
      third.add(.init(exactAmount: 30))
      XCTAssertEqual(
        third,
        currencyType.init(exactAmount: Decimal(string: "62.12")!),
        "add(_:) failed",
        file: file, line: line
      )
    }

    assertAdditionIsCorrect(for: USD.self)
    assertAdditionIsCorrect(for: JPY.self)
    assertAdditionIsCorrect(for: KWD.self)
  }

  func test_addition_withBinaryInteger_isCorrect() {
    func assertAdditionIsCorrect(for currencyType: (some CurrencyValue).Type, file: StaticString = #file, line: UInt = #line) {
      let first = currencyType.init(exactAmount: 300.12)
      XCTAssertEqual(
        first + (30 as Int),
        currencyType.init(exactAmount: 330.12),
        "operator failed",
        file: file, line: line
      )

      let second = currencyType.init(exactAmount: 32.12)
      XCTAssertEqual(
        second.adding(45 as Int),
        currencyType.init(exactAmount: 77.12),
        "adding(_:) failed",
        file: file, line: line
      )

      var third = second
      third.add(30 as Int)
      XCTAssertEqual(
        third,
        currencyType.init(exactAmount: Decimal(string: "62.12")!),
        "add(_:) failed",
        file: file, line: line
      )
    }

    assertAdditionIsCorrect(for: USD.self)
    assertAdditionIsCorrect(for: JPY.self)
    assertAdditionIsCorrect(for: KWD.self)
  }

  func test_addition_withDecimal_isCorrect() {
    func assertAdditionIsCorrect(for currencyType: (some CurrencyValue).Type, file: StaticString = #file, line: UInt = #line) {
      let first = currencyType.init(exactAmount: 300.12)
      XCTAssertEqual(
        first + (30 as Decimal),
        currencyType.init(exactAmount: 330.12),
        "operator failed",
        file: file, line: line
      )

      let second = currencyType.init(exactAmount: 32.12)
      XCTAssertEqual(
        second.adding(45 as Decimal),
        currencyType.init(exactAmount: 77.12),
        "adding(_:) failed",
        file: file, line: line
      )

      var third = second
      third.add(30.01 as Decimal)
      XCTAssertEqual(
        third,
        currencyType.init(exactAmount: Decimal(string: "62.13")!),
        "add(_:) failed",
        file: file, line: line
      )
    }

    assertAdditionIsCorrect(for: USD.self)
    assertAdditionIsCorrect(for: JPY.self)
    assertAdditionIsCorrect(for: KWD.self)
  }
}

// MARK: Subtraction

extension CurrencyValueArithmeticTests {
  func test_subtraction_withSelf_isCorrect() {
    func assertSubtractionIsCorrect(for currencyType: (some CurrencyValue).Type, file: StaticString = #file, line: UInt = #line) {
      let first = currencyType.init(exactAmount: 300.12)
      XCTAssertEqual(
        first - currencyType.init(exactAmount: 30.01),
        currencyType.init(exactAmount: Decimal(string: "270.11")!),
        "operator failed",
        file: file, line: line
      )

      let second = currencyType.init(exactAmount: 32.12)
      XCTAssertEqual(
        second.subtracting(.init(exactAmount: 45)),
        currencyType.init(exactAmount: -12.88),
        "subtracting(_:) failed",
        file: file, line: line
      )

      var third = second
      third.subtract(.init(exactAmount: 30))
      XCTAssertEqual(
        third,
        currencyType.init(exactAmount: Decimal(string: "2.12")!),
        "subtract(_:) failed",
        file: file, line: line
      )
    }

    assertSubtractionIsCorrect(for: USD.self)
    assertSubtractionIsCorrect(for: JPY.self)
    assertSubtractionIsCorrect(for: KWD.self)
  }

  func test_subtraction_withBinaryInteger_isCorrect() {
    func assertSubtractionIsCorrect(for currencyType: (some CurrencyValue).Type, file: StaticString = #file, line: UInt = #line) {
      let first = currencyType.init(exactAmount: 300.12)
      XCTAssertEqual(
        first - (30 as Int),
        currencyType.init(exactAmount: 270.12),
        "operator failed",
        file: file, line: line
      )

      let second = currencyType.init(exactAmount: 32.12)
      XCTAssertEqual(
        second.subtracting(45 as Int),
        currencyType.init(exactAmount: -12.88),
        "adding(_:) failed",
        file: file, line: line
      )

      var third = second
      third.subtract(30 as Int)
      XCTAssertEqual(
        third,
        currencyType.init(exactAmount: Decimal(string: "2.12")!),
        "add(_:) failed",
        file: file, line: line
      )
    }

    assertSubtractionIsCorrect(for: USD.self)
    assertSubtractionIsCorrect(for: JPY.self)
    assertSubtractionIsCorrect(for: KWD.self)
  }

  func test_subtraction_withDecimal_isCorrect() {
    func assertSubtractionIsCorrect(for currencyType: (some CurrencyValue).Type, file: StaticString = #file, line: UInt = #line) {
      let first = currencyType.init(exactAmount: 300.12)
      XCTAssertEqual(
        first - (30 as Decimal),
        currencyType.init(exactAmount: 270.12),
        "operator failed",
        file: file, line: line
      )

      let second = currencyType.init(exactAmount: 32.12)
      XCTAssertEqual(
        second.subtracting(45 as Decimal),
        currencyType.init(exactAmount: -12.88),
        "adding(_:) failed",
        file: file, line: line
      )

      var third = second
      third.subtract(30.01 as Decimal)
      XCTAssertEqual(
        third,
        currencyType.init(exactAmount: Decimal(string: "2.11")!),
        "add(_:) failed",
        file: file, line: line
      )
    }

    assertSubtractionIsCorrect(for: USD.self)
    assertSubtractionIsCorrect(for: JPY.self)
    assertSubtractionIsCorrect(for: KWD.self)
  }
}

// MARK: Multiplication

extension CurrencyValueArithmeticTests {
  func test_multiplication_withBinaryInteger_isCorrect() {
    func assertMultiplicationIsCorrect(for currencyType: (some CurrencyValue).Type, file: StaticString = #file, line: UInt = #line) {
      let first = currencyType.init(exactAmount: 300.12)
      XCTAssertEqual(
        first * (3 as Int),
        currencyType.init(exactAmount: 900.36),
        "operator failed",
        file: file, line: line
      )

      let second = currencyType.init(exactAmount: 32.12)
      XCTAssertEqual(
        second.multiplying(by: -3 as Int),
        currencyType.init(exactAmount: -96.36),
        "multiplying(by:) failed",
        file: file, line: line
      )

      var third = second
      third.multiply(by: 10 as Int)
      XCTAssertEqual(
        third,
        currencyType.init(exactAmount: Decimal(string: "321.2")!),
        "multiply(by:) failed",
        file: file, line: line
      )
    }

    assertMultiplicationIsCorrect(for: USD.self)
    assertMultiplicationIsCorrect(for: JPY.self)
    assertMultiplicationIsCorrect(for: KWD.self)
  }

  func test_multiplication_withDecimal_isCorrect() {
    func assertMultiplicationIsCorrect(for currencyType: (some CurrencyValue).Type, file: StaticString = #file, line: UInt = #line) {
      let first = currencyType.init(exactAmount: 300.12)
      XCTAssertEqual(
        first * (5.25 as Decimal),
        currencyType.init(exactAmount: 1575.63),
        "operator failed",
        file: file, line: line
      )

      let second = currencyType.init(exactAmount: 32.12)
      XCTAssertEqual(
        second.multiplying(by: -1.75 as Decimal),
        currencyType.init(exactAmount: -56.21),
        "multiplying(by:) failed",
        file: file, line: line
      )

      var third = second
      third.multiply(by: 7.1 as Decimal)
      XCTAssertEqual(
        third,
        currencyType.init(exactAmount: 228.052),
        "multiply(by:) failed",
        file: file, line: line
      )
    }

    assertMultiplicationIsCorrect(for: USD.self)
    assertMultiplicationIsCorrect(for: JPY.self)
    assertMultiplicationIsCorrect(for: KWD.self)
  }
}

// MARK: Division

extension CurrencyValueArithmeticTests {
  func test_division_withBinaryInteger_isCorrect() {
    func assertDivisionIsCorrect(for currencyType: (some CurrencyValue).Type, file: StaticString = #file, line: UInt = #line) {
      let first = currencyType.init(exactAmount: 300.12)
      XCTAssertEqual(
        first / (3 as Int),
        currencyType.init(exactAmount: 100.04),
        "operator failed",
        file: file, line: line
      )

      let second = currencyType.init(exactAmount: 33.12)
      XCTAssertEqual(
        second.dividing(by: -3 as Int),
        currencyType.init(exactAmount: Decimal(string: "-11.04")!),
        "dividing(by:) failed",
        file: file, line: line
      )

      var third = second
      third.divide(by: 10 as Int)
      XCTAssertEqual(
        third,
        currencyType.init(exactAmount: Decimal(string: "3.312")!),
        "divide(by:) failed",
        file: file, line: line
      )
    }

    assertDivisionIsCorrect(for: USD.self)
    assertDivisionIsCorrect(for: JPY.self)
    assertDivisionIsCorrect(for: KWD.self)
  }

  func test_division_withDecimal_isCorrect() {
    func assertDivisionIsCorrect(for currencyType: (some CurrencyValue).Type, file: StaticString = #file, line: UInt = #line) {
      let first = currencyType.init(exactAmount: 300)
      XCTAssertEqual(
        first / (2.4 as Decimal),
        currencyType.init(exactAmount: 125),
        "operator failed",
        file: file, line: line
      )

      let second = currencyType.init(exactAmount: Decimal(string: "33.33")!)
      XCTAssertEqual(
        second.dividing(by: -1.1 as Decimal),
        currencyType.init(exactAmount: -30.3),
        "dividing(by:) failed",
        file: file, line: line
      )

      var third = second
      third.divide(by: 3.3 as Decimal)
      XCTAssertEqual(
        third,
        currencyType.init(exactAmount: 10.1),
        "divide(by:) failed",
        file: file, line: line
      )
    }

    assertDivisionIsCorrect(for: USD.self)
    assertDivisionIsCorrect(for: JPY.self)
    assertDivisionIsCorrect(for: KWD.self)
  }
}

// MARK: Example Usage

extension CurrencyValueArithmeticTests {
  func test_sampleUSDTransaction_withTaxRate_isNotMissingPennies() {
    /*
     original price    taxes (9%)        result
     3.00              0.27              3.27
     2.99              0.2691 => 0.27    3.2591 => 3.26
     5.98              0.5382 => 0.54    6.5182 => 6.52
     ===               ===               ===
     11.97             1.0773 => 1.08    13.0473 => 13.05
     */
    let prices: [USD] = [
      3.00,
      2.99,
      5.98
    ]

    let subtotal = prices.sum()
    XCTAssertEqual(subtotal.exactAmount, 11.97)

    let taxes = prices.sum { $0 * 0.09 }
    XCTAssertEqual(taxes.exactAmount, 1.0773)
    XCTAssertEqual(taxes.roundedAmount, 1.08)
    XCTAssertEqual(subtotal * 0.09, taxes)

    let grandTotal = subtotal + taxes
    XCTAssertEqual(grandTotal.exactAmount, 13.0473)
    XCTAssertEqual(grandTotal.roundedAmount, 13.05)
  }

  func test_sampleUSDTransaction_withTaxRate_andDiscount_isNotMissingPennies() {
    /* .228735
     original price    discount (15%)    discount price      taxes (9%)          result
     3.00              0.45              2.55                0.2295   => 0.23    2.7795    => 2.78
     2.99              0.4485 => 0.45    2.5415 => 2.54      0.228735 => 0.23    2.770235  => 2.77
     5.98              0.897  => 0.90    5.083  => 5.08      0.45747  => 0.46    5.54047   => 5.54
     ===               ===               ===                 ===                 ===
     11.97             1.7955 => 1.80    10.1745 => 10.17    0.915705 => 0.92    11.090205 => 11.09
     */
    let prices: [USD] = [
      3.00,
      2.99,
      5.98
    ]

    let discountPrices = prices.map { $0 - ($0 * 0.15) }

    let discountSubtotal = discountPrices.sum()
    XCTAssertEqual(discountSubtotal.exactAmount, 10.1745)
    XCTAssertEqual(discountSubtotal.roundedAmount, 10.17)

    let discountTaxes = discountPrices.sum { $0 * 0.09 }
    XCTAssertEqual(discountTaxes.exactAmount, 0.915705)
    XCTAssertEqual(discountTaxes.roundedAmount, Decimal(string: "0.92")!)

    let grandTotal = discountSubtotal + discountTaxes
    XCTAssertEqual(grandTotal.exactAmount, 11.090205)
    XCTAssertEqual(grandTotal.roundedAmount, 11.09)
  }

  func test_sampleUSDHotelBookingTransaction() {
    /*
                        Decimal      |    USD (rounding at each step)
     Base Price:        199.98       |                    199.98
     ----
     6% Discount:        11.9988     |     11.9988  =>     12.00
     Running Total:     187.9812     |                    187.98
     ----
     9% Tax:             16.918308   |     16.9182  =>     16.92
     Running Total:     204.899508   |                    204.90
     ----
     Franchise fee:       5.68       |                      5.68
     Running Total:     210.579508   |                    210.58
     ----
     Total (7 days)   1,474.056556   |                  1,474.06
     ----
     10% Commission     147.4056556  |    147.406   =>    147.41
     Grand Total      1,621.4622116  |  1,621.466   =>  1,621.47
     */
    let roomDailyRate = USD(199.98)
    let discountRate = Decimal(0.06)
    let taxRate = Decimal(0.09)
    let flatFranchiseFee = USD(5.68)

    var runningDailyTotal = roomDailyRate

    // apply discount
    let discount = roomDailyRate * discountRate
    XCTAssertEqual(discount.roundedAmount, 12)
    runningDailyTotal -= discount
    XCTAssertEqual(runningDailyTotal.roundedAmount, 187.98)

    // apply taxes
    let taxes = runningDailyTotal * taxRate
    XCTAssertEqual(taxes.roundedAmount, Decimal(string: "16.92")!)
    runningDailyTotal += taxes
    XCTAssertEqual(runningDailyTotal.roundedAmount, 204.90)

    // apply flat fee
    runningDailyTotal += flatFranchiseFee
    XCTAssertEqual(runningDailyTotal.roundedAmount, 210.58)

    // calculate week total
    let weekRateTotal = runningDailyTotal * 7
    XCTAssertEqual(weekRateTotal.roundedAmount, 1_474.06)

    // calculate commission
    let commission = weekRateTotal * 0.10
    XCTAssertEqual(commission.roundedAmount, 147.41)

    let totalPrice = weekRateTotal + commission
    XCTAssertEqual(totalPrice.roundedAmount, 1_621.46)

    // Decimal validation
    let expectedResult: Decimal = {
      let basePrice = roomDailyRate.exactAmount
      let discount = basePrice * 0.06
      let tax = (basePrice - discount) * 0.09
      let dayPrice = basePrice - discount + tax + 5.68
      let weekPrice = dayPrice * 7
      let commission = weekPrice * 0.10
      return weekPrice + commission
    }()
    XCTAssertEqual(expectedResult, 1_621.4622116)

    XCTAssertEqual(totalPrice, USD(exactAmount: expectedResult))
  }
}
