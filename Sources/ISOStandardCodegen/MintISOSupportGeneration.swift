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

func makeMintISOCurrencySupportCodeFile(at destinationURL: URL, from currencies: [CurrencyMetadata]) throws {
  let alphaLookupSnippet = makeIdentifierLookupSnippet(for: currencies, identifier: .alphabetic)
  let numericLookupSnippet = makeIdentifierLookupSnippet(for: currencies, identifier: .numeric)

  let fileContent = makeFileContent(withBody: """
  extension CurrencyMint {
  \t\(alphaLookupSnippet)

  \t\(numericLookupSnippet)
  }
  """)

  try fileContent.write(to: destinationURL, atomically: true, encoding: .utf8)
}

enum Identifier {
  case alphabetic, numeric
}

fileprivate func makeIdentifierLookupSnippet(
  for currencies: [CurrencyMetadata],
  identifier type: Identifier
) -> String {
  let casesSnippet = currencies
    .lazy
    .sorted(by: type)
    .map {
      let patternMatch = type == .numeric ? $0.identifiers.numeric.description : "\"\($0.identifiers.alphabetic)\""

      return "case \(patternMatch): return _New_\($0.identifiers.alphabetic).self"
    }
    .joined(separator: "\n\t\t")

  let argumentName = type == .numeric ? "byNumCode" : "byAlphaCode"
  let parameterType = type == .numeric ? "UInt16" : "String"

  return """
  internal static func lookup(\(argumentName) code: \(parameterType)) -> (any Currency.Type)? {
  \t\tswitch code {
  \t\t\(casesSnippet)

  \t\tdefault: return nil
  \t\t}
  \t}
  """
}

extension LazySequence where Element == CurrencyMetadata {
  fileprivate func sorted(by identifier: Identifier) -> [Element] {
    self.sorted(by: {
      switch identifier {
      case .numeric: return $0.identifiers.numeric < $1.identifiers.numeric
      case .alphabetic: return $0.identifiers.alphabetic < $1.identifiers.alphabetic
      }
    })
  }
}
