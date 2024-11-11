// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LPUtils",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "LPUtils",
            targets: ["LPUtils"]),
    ],
    targets: [
        .target(
            name: "LPUtils"),

    ]
)
