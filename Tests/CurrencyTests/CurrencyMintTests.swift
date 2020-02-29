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

final class CurrencyMintTests: XCTestCase {
  func testLookupByString_passes() {
    let pounds = CurrencyMint.standard.make(identifier: "GBP")
    XCTAssertTrue(pounds is GBP)
    XCTAssertEqual(pounds?.amount, .zero)
  }
  
  func testLookupByString_withAmount() {
    let mint = CurrencyMint.standard
    
    let yen = mint.make(identifier: "JPY", amount: 302.98)
    XCTAssertTrue(yen is JPY)
    XCTAssertEqual(yen?.amount, 303)
    
    let usd = mint.make(identifier: "USD", minorUnits: 549)
    XCTAssertTrue(usd is USD)
    XCTAssertEqual(usd?.amount, 5.49)
  }
  
  func testLookupByString_fails() {
    let darseks = CurrencyMint.standard.make(identifier: "KED", amount: 30.23)
    XCTAssertNil(darseks)
  }
  
  func testLookupByNum_passes() {
    let euros = CurrencyMint.standard.make(identifier: 978)
    XCTAssertTrue(euros is EUR)
    XCTAssertEqual(euros?.amount, .zero)
  }
  
  func testLookupByNum_withAmount() {
    let mint = CurrencyMint.standard
    
    let pesos = mint.make(identifier: 484, amount: 3098.9823)
    XCTAssertTrue(pesos is MXN)
    XCTAssertEqual(pesos?.amount, 3098.98)
    
    let omanis = mint.make(identifier: 512, minorUnits: 198239)
    XCTAssertTrue(omanis is OMR)
    XCTAssertEqual(omanis?.amount, 198.239)
  }
  
  func testLookupByNum_fails() {
    let darseks = CurrencyMint.standard.make(identifier: 666)
    XCTAssertNil(darseks)
  }
  
  func testDefaultCurrency() {
    let mint = CurrencyMint(defaultCurrency: USD.self)
    let money = mint.make(identifier: "KED")
    XCTAssertTrue(money is USD)
  }
  
  func testFallbackLookup() {
    struct KED: CurrencyProtocol, CurrencyMetadata {
      static var name: String { return "Klingon Darseks" }
      static var alphabeticCode: String { return "KED" }
      static var numericCode: UInt16 { return 666 }
      static var minorUnits: UInt8 { return 3 }
      
      var minorUnits: Int64

      public init<T : BinaryInteger>(minorUnits: T) { self.minorUnits = .init(minorUnits) }
    }
    
    let mint = CurrencyMint(fallbackLookup: { identifier in
      guard identifier == .alphaCode("KED") || identifier == .numericCode(666) else { return nil }
      return KED.self
    })
    
    let d1 = mint.make(identifier: "KED", amount: 30.239)
    XCTAssertTrue(d1 is KED)
    XCTAssertEqual(d1 as? KED, 30.239)
    
    let d2 = mint.make(identifier: 666, minorUnits: d1?.minorUnits ?? .zero)
    XCTAssertTrue(d2 is KED)
    XCTAssertEqual(d2?.minorUnits, 30239)
  }
}
