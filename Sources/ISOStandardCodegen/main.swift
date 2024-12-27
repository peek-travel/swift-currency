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

let arguments = ProcessInfo.processInfo.arguments
guard arguments.count == 4 else {
  exit(65)
}

let isoStandardDefinitions = try parseDefinitions(at: URL(fileURLWithPath: arguments[1]))

try makeISOCurrencyDefinitionFile(at: URL(fileURLWithPath: arguments[2]), from: isoStandardDefinitions)
try makeMintISOCurrencySupportCodeFile(at: URL(fileURLWithPath: arguments[3]), from: isoStandardDefinitions)
