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

final class CurrencyMintTests: XCTestCase { }

// MARK: Fallback Lookup

extension CurrencyMintTests {
  func test_defaultLookup_whenLookupFails_returnsNil() {
    let mint = CurrencyMint.standard

    var darseks = mint.make(identifier: .fakeCurrencyAlphaCode, exactAmount: 30.23)
    XCTAssertNil(darseks)

    darseks = CurrencyMint.standard.make(identifier: .fakeCurrencyNumericCode, minorUnits: 300)
    XCTAssertNil(darseks)
  }

  func test_withFallbackLookup_whenLookupFails_callsFallbackLookup() {
    struct KED: Currency, CurrencyMetadata {
      static var name: String { return "Klingon Darseks" }
      static var alphabeticCode: String { return "KED" }
      static var numericCode: UInt16 { return 666 }
      static var minorUnits: UInt8 { return 3 }

      let exactAmount: Decimal
    }

    let expectation = self.expectation(description: "fallback lookup closure to be called")
    expectation.expectedFulfillmentCount = 2

    let mint = CurrencyMint(fallbackLookup: { identifier in
      expectation.fulfill()

      guard identifier == .alphaCode("KED") || identifier == .numericCode(666) else { return nil }
      return KED.self
    })

    let expectedAmount = Decimal(string: "30.239")!
    let d1 = mint.make(identifier: "KED", exactAmount: expectedAmount)
    XCTAssertTrue(d1 is KED)

    let d2 = mint.make(identifier: 666, minorUnits: .zero)
    XCTAssertTrue(d2 is KED)

    self.waitForExpectations(timeout: 1)
  }

  func test_withDefaultCurrencyLookup_whenLookupFails_returnsDefaultCurrency() {
    let mint = CurrencyMint(defaultCurrency: USD.self)

    var money = mint.make(identifier: .fakeCurrencyAlphaCode)
    XCTAssertTrue(money is USD)

    money = mint.make(identifier: .fakeCurrencyNumericCode)
    XCTAssertTrue(money is USD)
  }
}

// MARK: Factory Methods

extension CurrencyMintTests {
  func test_make_withMinorUnits_returnsISOCurrency() {
    let mint = CurrencyMint.standard

    let pounds = mint.make(identifier: .poundsAlphaCode, minorUnits: .zero)
    XCTAssertTrue(pounds is GBP)

    let yen = mint.make(identifier: .yenNumericCode, minorUnits: 300)
    XCTAssertTrue(yen is JPY)

    let euros = CurrencyMint.standard.make(identifier: 978, minorUnits: .zero)
    XCTAssertTrue(euros is EUR)
  }

  func test_make_withAmount_returnsISOCurrency() {
    let mint = CurrencyMint.standard

    let pounds = mint.make(identifier: .poundsAlphaCode, exactAmount: .zero)
    XCTAssertTrue(pounds is GBP)

    let yen = mint.make(identifier: .yenNumericCode, exactAmount: 192.8)
    XCTAssertTrue(yen is JPY)

    let euros = CurrencyMint.standard.make(identifier: 978, exactAmount: .zero)
    XCTAssertTrue(euros is EUR)
  }

  func test_make_withMinorUnits_matchesMinorUnits() {
    let mint = CurrencyMint.standard

    let pounds = mint.make(identifier: .poundsAlphaCode, minorUnits: 549)
    XCTAssertEqual(pounds?.minorUnits, 549)

    let yen = mint.make(identifier: .yenNumericCode, minorUnits: 302)
    XCTAssertEqual(yen?.minorUnits, 302)
  }

  func test_make_withAmount_matchesExactAmount() {
    let mint = CurrencyMint.standard

    let pounds = mint.make(identifier: .poundsAlphaCode, exactAmount: .zero)
    XCTAssertEqual(pounds?.exactAmount, .zero)

    let yen = mint.make(identifier: .yenNumericCode, exactAmount: 302.98)
    XCTAssertEqual(yen?.exactAmount, 302.98)
  }
}

// MARK: Test Helpers

extension CurrencyMint.CurrencyIdentifier {
  fileprivate static var fakeCurrencyAlphaCode: Self { "KED" } // "darseks"
  fileprivate static var fakeCurrencyNumericCode: Self { 666 }

  fileprivate static var poundsAlphaCode: Self { .alphaCode(GBP.alphabeticCode) }
  fileprivate static var yenNumericCode: Self { .numericCode(JPY.numericCode) }
}
