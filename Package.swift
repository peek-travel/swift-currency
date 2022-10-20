// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Currency",
    products: [
        .library(name: "Currency", targets: ["Currency"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "Currency", dependencies: []),
        .testTarget(name: "CurrencyTests", dependencies: ["Currency"]),
    ]
)
