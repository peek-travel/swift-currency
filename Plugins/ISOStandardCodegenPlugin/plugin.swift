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

import PackagePlugin

@main
struct ISOCurrencies: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
      let csvInputPath = context.package.directory.appending("ISO4217.csv")

      let currencyDefinitionPath = context.pluginWorkDirectory.appending("ISOCurrencies.swift")
      let mintDefinitionPath = context.pluginWorkDirectory.appending("CurrencyMint+ISOCurrencies.swift")

      return [.buildCommand(
        displayName: "Generating ISO Standard currency support code",
        executable: try context.tool(named: "ISOStandardCodegen").path,
        arguments: [
          csvInputPath.string,
          currencyDefinitionPath.string,
          mintDefinitionPath.string
        ],
        inputFiles: [
          csvInputPath
        ],
        outputFiles: [
          currencyDefinitionPath,
          mintDefinitionPath
        ]
      )]
    }
}
