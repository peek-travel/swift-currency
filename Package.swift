// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Currency",
    products: [
        .library(name: "Currency", targets: ["Currency"]),
    ],
    dependencies: [
      .package(url: "https://github.com/swiftcsv/SwiftCSV.git", from: "0.8.1")
    ],
    targets: [
      .target(
        name: "Currency",
        dependencies: [],
        plugins: ["ISOStandardCodegenPlugin"]
      ),
      .testTarget(name: "CurrencyTests", dependencies: ["Currency"]),

      .executableTarget(
        name: "ISOStandardCodegen",
        dependencies: [
          .product(name: "SwiftCSV", package: "SwiftCSV")
        ]
      ),
      .plugin(
        name: "ISOStandardCodegenPlugin",
        capability: .buildTool(),
        dependencies: ["ISOStandardCodegen"]
      )
    ]
)
