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

final class AnyCurrencyTests: XCTestCase {
  override func setUp() {
    UserDefaults.standard.set(["en_US"], forKey: "AppleLanguages")
  }
  
  func testInit() {
    XCTAssertEqual(USD(30.23).amount, 30.23)
    XCTAssertEqual(JPY(100.23).amount, 100)
    
    let gbp = GBP(02838.29808)
    XCTAssertEqual(gbp.amount, 2838.3)
    XCTAssertEqual(gbp.minorUnits, 283830)
  }
  
  func testMinorUnits() {
    let gbp = GBP(minorUnits: 300)
    XCTAssertTrue(gbp.isEqual(to: 3.0))
    XCTAssertEqual(gbp.minorUnits, 300)
    
    let jpy = JPY(minorUnits: 39820)
    XCTAssertTrue(jpy.isEqual(to: 39820))
    XCTAssertEqual(jpy.minorUnits, 39820)
  }
  
  func testNegative() {
    let gbp = GBP(minorUnits: -300)
    XCTAssertTrue(gbp.isEqual(to: -3.0))
    XCTAssertEqual(gbp.minorUnits, -300)
    
    let jpy = JPY(minorUnits: -39820)
    XCTAssertTrue(jpy.isEqual(to: -39820))
    XCTAssertEqual(jpy.minorUnits, -39820)
  }
  
  func testEquatable() {
    let first = USD(30.23)
    XCTAssertTrue(first == USD(30.23))
    XCTAssertTrue(first.isEqual(to: 30.23))
    XCTAssertFalse(first.isEqual(to: JPY(300)))
    XCTAssertFalse(first == GBP(107.982))
  }
    
  func testComparable() {
    let first: USD = 37.0237
    let second: USD = 198.157
    XCTAssertTrue(second > first)
  }
  
  func testHashable() {
    let usd = USD(30.23)
    XCTAssertEqual(usd.hashValue, usd.minorUnits.hashValue)
    
    var hasher = Hasher()
    hasher.combine(usd)
    XCTAssertEqual(hasher.finalize(), usd.minorUnits.hashValue)
  }
  
  func testAddition() {
    let first = USD(300.12)
    XCTAssertEqual(first + 30, 330.12)

    var second = USD(32.12)
    second += 45
    XCTAssertEqual(second, 77.12)

    let third = USD(75.98)
    XCTAssertEqual(third + Decimal(2), 77.98)

    var fourth = USD(1098.23)
    fourth += Decimal(10.98)
    XCTAssertEqual(fourth, 1109.21)
  }

  func testSubtraction() {
    let first = USD(300.12)
    XCTAssertEqual(first - 30, 270.12)

    var second = USD(32.12)
    second -= 45
    XCTAssertEqual(second, -12.88)

    let third = USD(75.98)
    XCTAssertEqual(third - Decimal(2), 73.98)

    var fourth = USD(100.45)
    fourth -= Decimal(50.30)
    XCTAssertEqual(fourth, 50.15)
  }

  func testDivision() {
    let first = USD(300.12)
    XCTAssertEqual(first / USD(30), 10)

    var second = USD(32.12)
    second /= USD(45)
    XCTAssertEqual(second.amount, 0.71)

    let third = USD(75.98)
    XCTAssertEqual(third / Decimal(2), 37.99)

    var fourth = USD(0982.738)
    fourth /= Decimal(7.7)
    XCTAssertEqual(fourth.amount, 127.63)
  }
  
  func testMultiplication() {
    let first = USD(300.12)
    XCTAssertEqual(first * USD(30), 9003.6)

    var second = USD(32.12)
    second *= USD(45)
    XCTAssertEqual(second.amount, 1445.4)

    let third = USD(75.98)
    XCTAssertEqual(third * Decimal(2), 151.96)
    
    var fourth = USD(0982.738)
    fourth *= Decimal(7.7)
    XCTAssertEqual(fourth.amount, 7567.1)
  }
  
  func testDescription() {
    XCTAssertEqual(USD(300.8).description, "300.8 USD")
    XCTAssertEqual(JPY(400.98).description, "401 JPY")
  }
  
  func testStringInterpolation_description() {
    XCTAssertEqual("\(USD(300.8).description)", "300.8 USD")
  }
  
  func testStringInterpolation_defaultFormatter() {
    XCTAssertEqual("\(USD(4321.389))", "$4,321.39")
  }
  
  func testStringInterpolation_customLocale() {
    let pounds = GBP(14928.789)
    XCTAssertEqual("\(pounds, forLocale: .init(identifier: "en_UK"))", "£14,928.79")
    XCTAssertEqual("\(pounds, forLocale: .init(identifier: "de_DE"))", "14.928,79 £")
  }
  
  func testStringInterpolation_customFormatter() {
    let pounds = GBP(14928.018)
    let formatter = NumberFormatter()
    formatter.currencyCode = pounds.metadata.alphabeticCode
    formatter.numberStyle = .currency
    formatter.currencyGroupingSeparator = " "
    formatter.currencyDecimalSeparator = "'"
    XCTAssertEqual("\(pounds, withFormatter: formatter)", "£14 928'02")
  }
  
  func testStringInterpolation_optional() {
    var pounds = Optional<GBP>.none
    XCTAssertEqual("\(pounds)", "nil")
    XCTAssertEqual("\(pounds, nilDescription: "N/A")", "N/A")
    
    pounds = .init(398.983)
    XCTAssertEqual("\(pounds)", "£398.98")
  }
}

// MARK: -
// MARK: Common Calculations

extension Sequence where Element: AnyCurrency {
  func applyingRate(_ rate: Decimal) -> [Element] {
    return self.reduce(into: [Element]()) { $0.append($1 + ($1 * rate)) }
  }
}

extension AnyCurrencyTests {
  func testSampleUSDCalculations() {
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
    XCTAssertEqual(subtotal, 11.97)
    
    let taxes = prices.sum { $0 * Decimal(0.09) }
    XCTAssertEqual(taxes, 1.08)
    XCTAssertEqual(subtotal * Decimal(0.09), 1.08)
    
    XCTAssertEqual(subtotal + taxes, 13.05)
    XCTAssertEqual(prices.applyingRate(0.09).sum(), 13.05)
    
    /* .228735
      original price    discount (15%)    discount price    taxes (9%)        result
      3.00              0.45              2.55              0.2295 => 0.23    2.7795 => 2.78
      2.99              0.4485 => 0.45    2.5415 => 2.54    0.2286 => 0.23    2.7701 => 2.77
      5.98              0.897  => 0.90    5.083  => 5.08    0.4575 => 0.46    5.5405 => 5.54
      ===               ===               ===               ===               ===
      11.97             1.7955 => 1.80    10.1745 => 10.17  0.9156 => 0.92    11.0901 => 11.09
     */
    
    let discount = prices.sum { $0 * Decimal(0.15) }
    XCTAssertEqual(discount, 1.80)
    let discountPrices = prices.applyingRate(-0.15)
    XCTAssertEqual(discountPrices.sum(), 10.17)
    
    let discountTaxes = discountPrices.sum { $0 * Decimal(0.09) }
    XCTAssertEqual(discountTaxes, 0.92)
    
    let discountTotal = discountPrices.applyingRate(0.09).sum()
    XCTAssertEqual(discountTotal, 11.09)
    
    let chained = prices
      .applyingRate(-0.15) // discount
      .applyingRate(0.09) // taxes
      .sum()
    XCTAssertEqual(chained, discountTotal)
  }
}

// MARK: -
// MARK: Sequence<AnyCurrency>

extension AnyCurrencyTests {
  func testSequenceSum() {
    let amounts = [USD(30.47), -107.8239, 1_203.9832, -504.3982]
    XCTAssertEqual(amounts.sum().amount, 622.23)
  }
  
  func testSequenceSum_withPredicate() {
    let amounts: [USD] = [304.98, 19.02, 30.21]
    let sumTotal = amounts.sum(where: { $0.amount > 20 })
    XCTAssertEqual(sumTotal.amount, 335.19)
  }
}
