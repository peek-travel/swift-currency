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

@testable import Currency
import XCTest

final class CurrencyDescriptorTests: XCTestCase { }

// MARK: Minor Units

extension CurrencyDescriptorTests {
  func test_minorUnitsCoefficient_forExactAmount_shiftsLeftByMinorUnits() {
    XCTAssertEqual(JPY.minorUnitsCoefficient(for: .exactAmount), 1)
    XCTAssertEqual(XTS.minorUnitsCoefficient(for: .exactAmount), 10)
    XCTAssertEqual(USD.minorUnitsCoefficient(for: .exactAmount), 100)
    XCTAssertEqual(KWD.minorUnitsCoefficient(for: .exactAmount), 1000)
  }

  func test_minorUnitsCoefficient_forMinorUnits_shiftsRightByMinorUnits() {
    XCTAssertEqual(JPY.minorUnitsCoefficient(for: .minorUnits), 1)
    XCTAssertEqual(XTS.minorUnitsCoefficient(for: .minorUnits), 0.1)
    XCTAssertEqual(USD.minorUnitsCoefficient(for: .minorUnits), 0.01)
    XCTAssertEqual(KWD.minorUnitsCoefficient(for: .minorUnits), 0.001)
  }
}
