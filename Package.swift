// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Package",
    platforms: [
        .iOS("8.0"),
        .macOS("10.9"),
        .watchOS("2.0"),
        .tvOS("9.0"),
    ],
    products: [
        .library(
            name: "Tracker",
            targets: ["Tracker"]
        ),
        .library(
            name: "TrackerTesting",
            targets: ["TrackerTesting"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/hectr/swift-idioms.git", from: "1.9.0"),
    ],
    targets: [
        .target(
            name: "Tracker",
            dependencies: ["Idioms"]
        ),
        .target(
            name: "TrackerTesting",
            dependencies: ["Tracker"]
        ),
        .testTarget(
            name: "TrackerTests",
            dependencies: ["Tracker", "TrackerTesting"]
        ),
    ]
)
