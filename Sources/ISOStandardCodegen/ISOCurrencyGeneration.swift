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

func makeISOCurrencyDefinitionFile(at destinationURL: URL, from metadata: [CurrencyMetadata]) throws {
  let typeDefinitions = makeTypeDefinitions(from: metadata)
  let fileContent = makeFileContent(
    withBody: "import struct Foundation.Decimal\n\n"
      .appending(typeDefinitions.joined(separator: "\n\n"))
  )

  try fileContent.write(to: destinationURL, atomically: true, encoding: .utf8)
}

private func makeTypeDefinitions(from metadata: [CurrencyMetadata]) -> [String] {
  return metadata.map {
    definition in

    let summary: String = {
      let alphaIdentifier = definition.identifiers.alphabetic

      switch alphaIdentifier {
      case "XXX":
        return """
        /// The currency to represent a transaction where no currency was involved; as defined by ISO 4217.
        ///
        /// As ISO 4217 does not specify a minor unit for XXX, the value of `0` is used.
        """

      case "XTS":
        return """
        /// The currency suitable for testing; as defined by ISO 4217.
        ///
        /// As ISO 4217 does not specify a minor unit for XTS, the value of `1` is used for validating rounding errors.
        """

      default:
        return "/// The \(definition.name) (\(alphaIdentifier)) currency, as defined by ISO 4217."
      }
    }()

    return """
    \(summary)
    public struct \(definition.identifiers.alphabetic): CurrencyProtocol, CurrencyMetadata {
      public static var name: String { "\(definition.name)" }
      public static var alphabeticCode: String { "\(definition.identifiers.alphabetic)" }
      public static var numericCode: UInt16 { \(definition.identifiers.numeric) }
      public static var minorUnits: UInt8 { \(definition.minorUnits) }

      public var minorUnits: Int64 { self._minorUnits }

      private let _minorUnits: Int64

      public init<T: BinaryInteger>(minorUnits: T) { self._minorUnits = .init(minorUnits) }
    }
            
    \(summary)
    public struct _New_\(definition.identifiers.alphabetic): Currency, CurrencyDescriptor {
      public static var name: String { "\(definition.name)" }
      public static var alphabeticCode: String { "\(definition.identifiers.alphabetic)" }
      public static var numericCode: UInt16 { \(definition.identifiers.numeric) }
      public static var minorUnits: UInt8 { \(definition.minorUnits) }

      public let exactAmount: Decimal

      public init(exactAmount: Decimal) { self.exactAmount = exactAmount }
    }
    """
  }
}
