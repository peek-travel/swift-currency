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

import Currency
import XCTest

final class MoneyTests: XCTestCase {
  override func setUp() {
    UserDefaults.standard.set(["en_US"], forKey: "AppleLanguages")
  }
  
  func testInit() {
    XCTAssertEqual(USD(30.23).roundedAmount, 30.23)
    XCTAssertEqual(JPY(100.23).roundedAmount, 100)
    
    let gbp = GBP(02838.29808)
    XCTAssertEqual(gbp.roundedAmount, 2838.3)
    XCTAssertEqual(gbp.exactAmount, 2838.29808)
  }
  
  func testMinorUnits() {
    XCTAssertTrue(GBP(minorUnits: 300).isEqual(to: 3.0))
    XCTAssertTrue(JPY(minorUnits: 39820).isEqual(to: 39820))
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
    XCTAssertEqual(usd.hashValue, usd.exactAmount.hashValue)
    
    var hasher = Hasher()
    hasher.combine(usd)
    XCTAssertEqual(hasher.finalize(), usd.exactAmount.hashValue)
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
    XCTAssertEqual(second.roundedAmount, 0.71)

    let third = USD(75.98)
    XCTAssertEqual(third / Decimal(2), 37.99)

    var fourth = USD(0982.738)
    fourth /= Decimal(7.7)
    XCTAssertEqual(fourth.roundedAmount, 127.63)
  }
  
  func testMultiplication() {
    let first = USD(300.12)
    XCTAssertEqual(first * USD(30), 9003.6)

    var second = USD(32.12)
    second *= USD(45)
    XCTAssertEqual(second.roundedAmount, 1445.4)

    let third = USD(75.98)
    XCTAssertEqual(third * Decimal(2), 151.96)
    
    var fourth = USD(0982.738)
    fourth *= Decimal(7.7)
    XCTAssertEqual(fourth.roundedAmount, 7567.08)
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
