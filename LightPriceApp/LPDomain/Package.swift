// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LPDomain",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "LPDomain",
            targets: ["LPDomain"]),
    ],
    dependencies: [
        .package(path: "../LPUtils"),
    ],
    targets: [
        .target(
            name: "LPDomain",
            dependencies: ["LPUtils"]
        ),
    ]
)
