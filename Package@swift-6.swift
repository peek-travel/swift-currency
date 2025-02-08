// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-currency",
    products: [
        .library(name: "Currency", targets: ["Currency"]),
    ],
    dependencies: [],
    targets: [
      .target(
        name: "Currency",
        dependencies: [],
        plugins: ["ISOStandardCodegenPlugin"]
      ),
      .testTarget(name: "CurrencyTests", dependencies: ["Currency"]),

      .executableTarget(
        name: "ISOStandardCodegen"
      ),
      .plugin(
        name: "ISOStandardCodegenPlugin",
        capability: .buildTool(),
        dependencies: ["ISOStandardCodegen"]
      )
    ]
)
