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

func makeFileContent(withBody content: String) -> String {
  let currentYear = Calendar(identifier: .gregorian).component(.year, from: Date())

  return """
  //===----------------------------------------------------------------------===//
  //
  // This source file is part of the SwiftCurrency open source project
  //
  // Copyright (c) 2020-\(currentYear) SwiftCurrency project authors
  // Licensed under MIT License
  //
  // See LICENSE.txt for license information
  // See CONTRIBUTORS.txt for the list of SwiftCurrency project authors
  //
  // SPDX-License-Identifier: MIT
  //
  //===----------------------------------------------------------------------===//

  /*
    WARNING:

    This file's contents are automatically generated as part of the module's build process.

    Changes manually made will be lost!
  */

  \(content)
  """
}
