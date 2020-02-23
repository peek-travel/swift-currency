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

@testable import Currency
import XCTest

final class AnyCurrencyTests: XCTestCase {
  override func setUp() {
    UserDefaults.standard.set(["en_US"], forKey: "AppleLanguages")
  }
}

// MARK: Initialization

extension AnyCurrencyTests {
  func testDecimalInit() {
    _assertCurrencyValue(USD(30.23), equalsAmount: 30.23, equalsMinorUnits: 3023)
    _assertCurrencyValue(USD(-208.001), equalsAmount: -208.00, equalsMinorUnits: -20800)

    _assertCurrencyValue(JPY(100.23), equalsAmount: 100, equalsMinorUnits: 100)
    _assertCurrencyValue(JPY(-39820), equalsAmount: -39820, equalsMinorUnits: -39820)

    _assertCurrencyValue(KWD(02838.29708), equalsAmount: 2838.297, equalsMinorUnits: 2838297)
    _assertCurrencyValue(KWD(-300.87), equalsAmount: -300.87, equalsMinorUnits: -300870)
  }

  func testNaNInit() {
    XCTAssertNil(USD(amount: .nan))
    XCTAssertNil(JPY(amount: .quietNaN))
  }

  func testMinorUnitInit() {
    _assertCurrencyValue(USD(minorUnits: 300), equalsAmount: 3, equalsMinorUnits: 300)
    _assertCurrencyValue(USD(minorUnits: -39820), equalsAmount: -398.2, equalsMinorUnits: -39820)

    _assertCurrencyValue(JPY(minorUnits: 2838), equalsAmount: 2838, equalsMinorUnits: 2838)
    _assertCurrencyValue(JPY(minorUnits: -300), equalsAmount: -300, equalsMinorUnits: -300)

    _assertCurrencyValue(KWD(minorUnits: 2838297), equalsAmount: 2838.297, equalsMinorUnits: 2838297)
    _assertCurrencyValue(KWD(minorUnits: -300877), equalsAmount: -300.877, equalsMinorUnits: -300877)
  }

  private func _assertCurrencyValue<Currency: CurrencyProtocol>(
    _ value: Currency?,
    equalsAmount expectedAmount: Decimal,
    equalsMinorUnits expectedMinorUnits: Int64,
    file: StaticString = #file,
    line: UInt = #line) {
    guard let value = value else { return XCTFail("Nil value found", file: file, line: line) }
    XCTAssertEqual(value.minorUnits, expectedMinorUnits, file: file, line: line)
    XCTAssertEqual(value.amount, expectedAmount, file: file, line: line)
  }
}

// MARK: -
// MARK: Protocol Conformances

extension AnyCurrencyTests {
  func testEquatable() {
    let first = USD(30.23)
    XCTAssertEqual(first, USD(30.23))
    XCTAssertEqual(first, USD(30.226))
    XCTAssertNotEqual(first, USD(30.235))
    XCTAssertNotEqual(first, USD(30.225))
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
}

// MARK: -
// MARK: String Representations

extension AnyCurrencyTests {
  func testReflectionRepresentation() {
    let str = String(reflecting: USD(30.02))
    XCTAssertEqual(str, "USD(30.02)")
  }

  func testDescriptionRepresentations() {
    let yen = JPY(400.98)
    XCTAssertEqual(yen.description, "401 JPY")
    XCTAssertEqual("\(yen)", yen.description)

    let usd = USD(300.8)
    XCTAssertEqual(usd.description, "300.8 USD")
    XCTAssertEqual(usd.debugDescription, "USD(300.8)")
    XCTAssertEqual(usd.playgroundDescription as? String, usd.debugDescription)
  }

  func testStringInterpolation_defaultFormatter() {
    XCTAssertEqual("\(localize: USD(4321.389))", "$4,321.39")

    #if swift(<5.2) && os(Linux)
    let expectedDinar = "KWD301.982"
    #else
    let expectedDinar = "KWD 301.982"
    #endif
    XCTAssertEqual("\(localize: KWD(301.9823))", expectedDinar)

    #if swift(<5.1)
    let expectedYen = "¥401.00"
    #else
    let expectedYen = "¥401"
    #endif
    XCTAssertEqual("\(localize: JPY(400.9))", expectedYen)
  }

  func testStringInterpolation_customLocale() {
    let pounds = GBP(14928.789)
    XCTAssertEqual("\(localize: pounds, forLocale: .init(identifier: "en_UK"))", "£14,928.79")
    XCTAssertEqual("\(localize: pounds, forLocale: .init(identifier: "de_DE"))", "14.928,79 £")

    let yen = JPY(400.9)
    #if swift(<5.1) && os(Linux)
    let expectedFrenchYen = "401,00 JPY"
    let expectedGreekYen = "401,00 JP¥"
    #else
    let expectedFrenchYen = "401 JPY"
    let expectedGreekYen = "401 JP¥"
    #endif
    XCTAssertEqual("\(localize: yen, forLocale: .init(identifier: "fr"))", expectedFrenchYen)
    XCTAssertEqual("\(localize: yen, forLocale: .init(identifier: "el"))", expectedGreekYen)

    let dinar = KWD(100.9289)
    #if swift(<5.2)
    let expectedIrishDinar = "KWD100.929"
    #else
    let expectedIrishDinar = "KWD 100.929"
    #endif
    XCTAssertEqual("\(localize: dinar, forLocale: .init(identifier: "ga"))", expectedIrishDinar)
    XCTAssertEqual("\(localize: dinar, forLocale: .init(identifier: "hr"))", "100,929 KWD")
  }

  func testStringInterpolation_customFormatter() {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.currencyGroupingSeparator = " "
    formatter.currencyDecimalSeparator = "'"

    let pounds = GBP(14928.018)
    formatter.currencyCode = GBP.alphabeticCode
    XCTAssertEqual("\(localize: pounds, withFormatter: formatter)", "£14 928'02")

    let yen = JPY(4000.9)
    formatter.currencyCode = JPY.alphabeticCode
    XCTAssertEqual("\(localize: yen, withFormatter: formatter)", "¥4 001")

    let dinar = KWD(92.0299)
    formatter.currencyCode = KWD.alphabeticCode
    #if swift(<5.2) && os(Linux)
    let expectedDinar = "KWD92'030"
    #else
    let expectedDinar = "KWD 92'030"
    #endif
    XCTAssertEqual("\(localize: dinar, withFormatter: formatter)", expectedDinar)
  }

  func testStringInterpolation_optional() {
    var pounds = Optional<GBP>.none
    XCTAssertEqual("\(localize: pounds)", "nil")
    XCTAssertEqual("\(localize: pounds, nilDescription: "N/A")", "N/A")

    pounds = .init(398.983)
    XCTAssertEqual("\(localize: pounds)", "£398.98")
  }
}

// MARK: -

// MARK: Basic Arithmetic

extension AnyCurrencyTests {
  func testAddition() {
    let first = USD(300.12)
    XCTAssertEqual(first + 30, 330.12)

    var second = USD(32.12)
    second += 45
    XCTAssertEqual(second, 77.12)
  }

  func testSubtraction() {
    let first = USD(300.12)
    XCTAssertEqual(first - 30, 270.12)

    var second = USD(32.12)
    second -= 45
    XCTAssertEqual(second, -12.88)
  }

  func testDivision() {
    let first = USD(300.12)
    XCTAssertEqual(first / USD(30), 10)

    var second = USD(32.12)
    second /= USD(45)
    XCTAssertEqual(second.amount, 0.71)
  }
  
  func testMultiplication() {
    let first = USD(300.12)
    XCTAssertEqual(first * USD(30), 9003.6)

    var second = USD(32.12)
    second *= USD(45)
    XCTAssertEqual(second.amount, 1445.4)
  }

  func testNegation() {
    let min = USD(minorUnits: Int8.min)
    XCTAssertEqual(min.minorUnits, -128)
    XCTAssertEqual(min.negated().minorUnits, 128)

    let max = KWD(minorUnits: Int8.max)
    XCTAssertEqual(max.minorUnits, 127)
    XCTAssertEqual(max.negated().minorUnits, -127)

    let yen = JPY(minorUnits: 30)
    XCTAssertEqual(yen.minorUnits, 30)
    XCTAssertEqual(yen.negated().minorUnits, -30)
  }
}

// MARK: Advanced Calculations

extension Sequence where Element: AnyCurrency {
  func applyingRate(_ rate: Decimal) -> [Element] {
    return self.reduce(into: [Element]()) { result, next in
      let newElement = next + Element(scalingAndRounding: next.amount * rate)
      result.append(newElement)
    }
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
    
    let taxes = prices.sum { $0 * 0.09 }
    XCTAssertEqual(taxes, 1.08)
    XCTAssertEqual(subtotal * 0.09, 1.08)
    
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
    
    let discount = prices.sum { $0 * 0.15 }
    XCTAssertEqual(discount, 1.80)
    let discountPrices = prices.applyingRate(-0.15)
    XCTAssertEqual(discountPrices.sum(), 10.17)
    
    let discountTaxes = discountPrices.sum { $0 * 0.09 }
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
