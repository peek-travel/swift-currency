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

public final class OpaqueCurrencyTests: XCTestCase {
  func test_equality() {
    let opaque = OpaqueCurrency(wrapping: USD(0))
    XCTAssertTrue(opaque == USD(0))
    XCTAssertFalse(opaque == EUR(0))
  }
  
  func test_canDoMath() {
    let original = OpaqueCurrency(wrapping: USD(0))
    let sum = original + OpaqueCurrency(wrapping: USD(3))
    XCTAssertEqual(sum.value.amount, 3)
    let product = sum * OpaqueCurrency(wrapping: USD(2))
    XCTAssertEqual(product.value.amount, 6)
    let quotient = product / OpaqueCurrency(wrapping: USD(3))
    XCTAssertEqual(quotient.value.amount, 2)
    let difference = quotient - OpaqueCurrency(wrapping: USD(3))
    XCTAssertEqual(difference.value.amount, -1)
  }
}

// MARK: Generics

private func requiresAnyCurrency<T: AnyCurrency>(_ t: T) { }

extension OpaqueCurrencyTests {
  func test_canBeUsedAsGenericParameter() {
    let currency = OpaqueCurrency(wrapping: USD(0))
    requiresAnyCurrency(currency)
  }
  
  func test_canBeUsedAsTypeConstraint() {
    class NeedsCurrency<Currency: AnyCurrency> {
      let value: Currency
      init(_ value: Currency) { self.value = value }
    }
    
    let currency = OpaqueCurrency(wrapping: USD(0))
    let t = NeedsCurrency(currency)
    XCTAssert(t.value == USD(0))
  }
  
  func test_canBeUsedSafelyInGenerics() {
    class NeedsCurrency<Currency: AnyCurrency> {
      var value: Currency
      init(_ value: Currency) { self.value = value }
      func reset() { self.value *= Currency(0) }
      func double() { self.value += self.value }
      func half() { self.value /= Currency(2) }
      func increment() { self.value += Currency(1) }
      func decrement() { self.value -= Currency(1) }
    }
    
    let currency = OpaqueCurrency(wrapping: USD(100))
    let t = NeedsCurrency(currency)
    
    t.half()
    XCTAssertEqual(t.value.amount, 50)
    
    for _ in 0..<20 { t.decrement() }
    t.double()
    XCTAssertEqual(t.value.amount, 60)
    
    t.reset()
    for _ in 0..<30 { t.increment() }
    t.half()
    for _ in 0..<10 { t.decrement() }
    t.double()
    XCTAssertEqual(t.value.amount, 110)
  }
}
