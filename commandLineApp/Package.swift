// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "commandLineApp",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/Dev1an/Swift-Atem", from: "0.2.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "commandLineApp",
            dependencies: ["Atem"]),
        .testTarget(
            name: "commandLineAppTests",
            dependencies: ["commandLineApp"]),
    ]
)
