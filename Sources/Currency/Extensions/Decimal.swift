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

import Foundation

extension Decimal {
  #if swift(<5.1)
  internal var int64Value: Int64 { return NSDecimalNumber(decimal: self).int64Value }
  #else
  internal var int64Value: Int64 { return (self as NSNumber).int64Value }
  #endif

  internal func roundedAndScaled(to unitScale: UInt8) -> Decimal {
    let scale = Int(unitScale)
    var result = Decimal.zero
    withUnsafePointer(to: self) { NSDecimalRound(&result, $0, scale, .bankers) }
    return result.scaled(to: scale)
  }
  
  internal func scaled(to scale: Int, inverse: Bool = false) -> Decimal {
    return self * .init(
      sign: .plus,
      exponent: inverse ? scale * -1 : scale,
      significand: 1
    )
  }
}
