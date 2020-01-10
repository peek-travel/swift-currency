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

final class CurrencyMintTests: XCTestCase {
  func testLookupByString_passes() {
    let mint = CurrencyMint()
    let pounds = mint.make(alphabeticCode: "GBP")
    XCTAssertEqual(pounds?.amount, .zero)
  }
  
  func testLookupByString_withAmount() {
    let mint = CurrencyMint()
    
    let yen = mint.make(alphabeticCode: "JPY", amount: 302.98)
    XCTAssertEqual(yen?.amount, 303)
    
    let usd = mint.make(alphabeticCode: "USD", minorUnits: 549)
    XCTAssertEqual(usd?.amount, 5.49)
  }
  
  func testLookupByString_fails() {
    let mint = CurrencyMint()
    let talons = mint.make(alphabeticCode: "KLT")
    XCTAssertNil(talons)
  }
  
  func testLookupByNum_passes() {
    let mint = CurrencyMint()
    let euros = mint.make(numericCode: 978)
    XCTAssertEqual(euros?.amount, .zero)
  }
  
  func testLookupByNum_withAmount() {
    let mint = CurrencyMint()
    
    let pesos = mint.make(numericCode: 484, amount: 3098.9823)
    XCTAssertEqual(pesos?.amount, 3098.98)
    
    let omanis = mint.make(numericCode: 512, minorUnits: 198239)
    XCTAssertEqual(omanis?.amount, 198.239)
  }
  
  func testLookupByNum_fails() {
    let mint = CurrencyMint()
    let talons = mint.make(numericCode: 666)
    XCTAssertNil(talons)
  }
}
