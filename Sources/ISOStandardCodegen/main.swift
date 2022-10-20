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

let arguments = ProcessInfo.processInfo.arguments
guard arguments.count == 4 else {
  throw ProcessingError.missingArgument
}

let isoStandardMetadata = try parseMetadataFromCSV(at: URL(fileURLWithPath: arguments[1]))

try makeISOCurrencyDefinitionFile(at: URL(fileURLWithPath: arguments[2]), from: isoStandardMetadata)
try makeMintISOCurrencySupportCodeFile(at: URL(fileURLWithPath: arguments[3]), from: isoStandardMetadata)
