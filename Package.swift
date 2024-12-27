// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Currency",
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
