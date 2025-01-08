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

import Foundation

func parseDefinitions(at file: URL) throws -> [CurrencyDefinition] {
  let jsonData = try Data(contentsOf: file)

  return try JSONDecoder().decode([CurrencyDefinition].self, from: jsonData)
}

struct CurrencyDefinition {
  let name: String
  let identifiers: (alphabetic: String, numeric: Int)
  let minorUnits: Int
}

extension CurrencyDefinition: Decodable {
  enum CodingKeys: String, CodingKey {
    case name = "CcyNm"
    case alphaCode = "Ccy"
    case numericCode = "CcyNbr"
    case minorUnits = "CcyMnrUnts"
  }

  init(from decoder: any Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    self.name = try container.decode(String.self, forKey: .name)
    self.identifiers = (
      try container.decode(String.self, forKey: .alphaCode),
      try container.decode(Int.self, forKey: .numericCode)
    )
    self.minorUnits = try container.decode(Int.self, forKey: .minorUnits)
  }
}
