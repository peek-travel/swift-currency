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

final class CurrencyValueStringRepresentationTests: XCTestCase {
  let sampleDollar = USD(300.8)
  let sampleYen    = JPY(400.98)
}

// MARK: Reflection Description

extension CurrencyValueStringRepresentationTests {
  func test_reflectionRepresentation_includesIdentifierName() {
    XCTAssertTrue(String(reflecting: self.sampleDollar).contains(USD.alphabeticCode))
    XCTAssertTrue(String(reflecting: self.sampleYen).contains(JPY.alphabeticCode))
  }

  func test_reflectionRepresentation_includesExactAmount() {
    XCTAssertTrue(String(reflecting: self.sampleDollar).contains(self.sampleDollar.exactAmount.description))
    XCTAssertTrue(String(reflecting: self.sampleYen).contains(self.sampleYen.exactAmount.description))
  }

  func test_customMirror_children_includes_exactAmount() throws {
    let child = try XCTUnwrap(
      Mirror(reflecting: self.sampleDollar)
        .children
        .first(where: { $0.label == "exactAmount" })
    )
    XCTAssertEqual(child.value as? Decimal, self.sampleDollar.exactAmount)
  }

  func test_customMirror_children_includes_minorUnits() throws {
    let child = try XCTUnwrap(
      Mirror(reflecting: self.sampleDollar)
        .children
        .first(where: { $0.label == "minorUnits" })
    )
    XCTAssertEqual(child.value as? CurrencyMinorUnitRepresentation, self.sampleDollar.minorUnits)
  }

  func test_customMirror_children_includes_descriptor() throws {
    let child = try XCTUnwrap(
      Mirror(reflecting: self.sampleDollar)
        .children
        .first(where: { $0.label == "descriptor" })
    )
    XCTAssertNotNil(child.value as? USD.Type)
  }
}

// MARK: String Description

extension CurrencyValueStringRepresentationTests {
  func test_description_includesIdentifierName() {
    XCTAssertTrue(self.sampleDollar.description.contains(USD.alphabeticCode))
    XCTAssertTrue(self.sampleYen.description.contains(JPY.alphabeticCode))
  }

  func test_description_includesExactAmount() {
    XCTAssertTrue(self.sampleDollar.description.contains(self.sampleDollar.exactAmount.description))
    XCTAssertTrue(self.sampleYen.description.contains(self.sampleYen.exactAmount.description))
  }
}

// MARK: Debug Description

extension CurrencyValueStringRepresentationTests {
  func test_debugDescription_includesIdentifierName() {
    XCTAssertTrue(self.sampleDollar.debugDescription.contains(USD.alphabeticCode))
    XCTAssertTrue(self.sampleYen.debugDescription.contains(JPY.alphabeticCode))
  }

  func test_debugDescription_includesExactAmount() {
    XCTAssertTrue(self.sampleDollar.debugDescription.contains(self.sampleDollar.exactAmount.description))
    XCTAssertTrue(self.sampleYen.debugDescription.contains(self.sampleYen.exactAmount.description))
  }

  func test_debugDescription_includesMinorUnits() {
    XCTAssertTrue(self.sampleDollar.debugDescription.contains(self.sampleDollar.minorUnits.description))
    XCTAssertTrue(self.sampleYen.debugDescription.contains(self.sampleYen.minorUnits.description))
  }
}

// MARK: Playground Description

extension CurrencyValueStringRepresentationTests {
  func test_playgroundDescription_matchesDebugDescription() {
    XCTAssertEqual(self.sampleDollar.playgroundDescription as? String, self.sampleDollar.debugDescription)
    XCTAssertEqual(self.sampleYen.playgroundDescription as? String, self.sampleYen.debugDescription)
  }
}

// MARK: String Interpolation

extension CurrencyValueStringRepresentationTests {
  func test_stringInterpolation_forLocale_whenNilValue_usesNilDescription_whenProvided() {
    let value: USD? = nil
    XCTAssertEqual("\(localize: value, nilDescription: #function)", #function)
  }

  func test_stringInterpolation_withFormatter_whenNilValue_usesNilDescription_whenProvided() {
    let value: USD? = nil
    XCTAssertEqual("\(localize: value, with: NumberFormatter(), nilDescription: #function)", #function)
  }

  func test_stringInterpolation_forLocale_whenNilValue_hasDefaultDescription() {
    let value: USD? = nil
    XCTAssertEqual("\(localize: value)", "nil")
  }

  func test_stringInterpolation_withFormatter_whenNilValue_hasDefaultDescription() {
    let value: USD? = nil
    XCTAssertEqual("\(localize: value, with: NumberFormatter())", "nil")
  }

  func test_stringInterpolation_forLocale_usesLocale_whenProvided() {
    let pounds = GBP(14928.789)
    XCTAssertEqual("\(localize: pounds, for: .init(identifier: "en_UK"))", "£14,928.79")
    XCTAssertEqual("\(localize: pounds, for: .init(identifier: "de_DE"))", "14.928,79 £")
  }

  func test_stringInterpolation_withFormatter_usesFormatter_whenProvided() {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.currencyGroupingSeparator = " "
    formatter.currencyDecimalSeparator = "'"
    formatter.locale = .init(identifier: "en_US")

    let pounds = GBP(14928.018)
    formatter.currencyCode = GBP.alphabeticCode
    XCTAssertEqual("\(localize: pounds, with: formatter)", "£14 928'02")

    let expectedYenResult = "¥4 001"
    let yen = JPY(4000.9)
    formatter.currencyCode = JPY.alphabeticCode
    XCTAssertEqual("\(localize: yen, with: formatter)", expectedYenResult)
  }

  func test_stringInterpolation_forLocale_usesDefaultLocale() {
    XCTAssertEqual("\(localize: USD(4321.389), for: Locale(identifier: "en_US"))", "$4,321.39")
  }
}

// MARK: LocalizedString

extension CurrencyValueStringRepresentationTests {
  func test_localizedString_forLocale_usesDefaultLocale() {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.locale = .current
    formatter.currencyCode = USD.alphabeticCode
    let expectedOutput = formatter.string(for: Decimal(4321.389))
    XCTAssertEqual(expectedOutput, USD(4321.389).localizedString())
  }

  func test_localizedString_forLocale_usesProvidedLocale() {
    let pounds = GBP(14928.789)
    XCTAssertEqual(pounds.localizedString(for: .init(identifier: "en_UK")), "£14,928.79")
    XCTAssertEqual(pounds.localizedString(for: .init(identifier: "de_DE")), "14.928,79 £")
  }

  func test_localizedString_withFormatter_usesProvidedFormatter() {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.currencyGroupingSeparator = " "
    formatter.currencyDecimalSeparator = "'"
    formatter.currencyCode = GBP.alphabeticCode
    formatter.locale = .init(identifier: "en_US")

    let pounds = GBP(14928.018)
    XCTAssertEqual(pounds.localizedString(using: formatter), "£14 928'02")

    let expectedYenResult = "¥4 001"
    let yen = JPY(4000.9)
    formatter.currencyCode = JPY.alphabeticCode
    XCTAssertEqual(yen.localizedString(using: formatter), expectedYenResult)
  }
}
