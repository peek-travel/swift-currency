//===----------------------------------------------------------------------===//
//
// This source file is part of the SwiftCurrency open source project
//
// Copyright (c) 2022 SwiftCurrency project authors
// Licensed under MIT License
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of SwiftCurrency project authors
//
// SPDX-License-Identifier: MIT
//
//===----------------------------------------------------------------------===//

import Foundation
import SwiftCSV

struct CurrencyMetadata {
  let country: String
  let name: String
  let identifiers: (alphabetic: String, numeric: Int)
  let minorUnits: Int

  init(raw: [String: String]) {
    self.country = raw["CtryNm"]!
    self.name = raw["CcyNm"]!
    self.identifiers = (raw["Ccy"]!, Int(raw["CcyNbr"]!)!)
    self.minorUnits = Int(raw["CcyMnrUnts"]!)!
  }
}

func parseMetadataFromCSV(at sourceURL: URL) throws -> [CurrencyMetadata] {
  let csv = try CSV<Enumerated>(url: sourceURL)

  guard !csv.rows.isEmpty else { throw ProcessingError.missingContent }

  var currencies: [CurrencyMetadata] = []
  currencies.reserveCapacity(csv.rows.count)

  try csv.enumerateAsDict { currencies.append(.init(raw: $0)) }

  return currencies
}
