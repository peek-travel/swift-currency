//===----------------------------------------------------------------------===//
//
// This source file is part of the SwiftCurrency open source project
//
// Copyright (c) 2024-2025 SwiftCurrency project authors
// Licensed under MIT License
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of SwiftCurrency project authors
//
// SPDX-License-Identifier: MIT
//
//===----------------------------------------------------------------------===//

import PackagePlugin

@main
struct ISOCurrencies: BuildToolPlugin {
  #if swift(>=6) && compiler(>=6)
  func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
    let dataInputURL = context.package.directoryURL.appending(path: "ISO4217.json")

    let currencyDefinitionURL = context.pluginWorkDirectoryURL.appending(path: "ISOCurrencies.swift")
    let mintDefinitionURL = context.pluginWorkDirectoryURL.appending(path: "CurrencyMint+ISOCurrencyLookup.swift")

    return [
      .buildCommand(
        displayName: "Generating ISO Standard currency support code",
        executable: try context.tool(named: "ISOStandardCodegen").url,
        arguments: [
          dataInputURL.path(),
          currencyDefinitionURL.path(),
          mintDefinitionURL.path()
        ],
        environment: [:],
        inputFiles: [
          dataInputURL
        ],
        outputFiles: [
          currencyDefinitionURL,
          mintDefinitionURL
        ]
      )
    ]
  }
  #else
  func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
    let dataInputPath = context.package.directory.appending("ISO4217.json")

    let currencyDefinitionPath = context.pluginWorkDirectory.appending("ISOCurrencies.swift")
    let mintDefinitionPath = context.pluginWorkDirectory.appending("CurrencyMint+ISOCurrencyLookup.swift")

    return [.buildCommand(
      displayName: "Generating ISO Standard currency support code",
      executable: try context.tool(named: "ISOStandardCodegen").path,
      arguments: [
        dataInputPath.string,
        currencyDefinitionPath.string,
        mintDefinitionPath.string
      ],
      inputFiles: [
        dataInputPath
      ],
      outputFiles: [
        currencyDefinitionPath,
        mintDefinitionPath
      ]
    )]
  }
  #endif
}
