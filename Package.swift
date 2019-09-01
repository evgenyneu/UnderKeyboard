// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "UnderKeyboard",
    platforms: [
        .iOS(.v8)
    ],
    products: [
        .library(name: "UnderKeyboard", targets: ["UnderKeyboard"])
    ],
    targets: [
        .target(name: "UnderKeyboard", dependencies: [], path: "UnderKeyboard"),
        .testTarget(name: "UnderKeyboardTests", dependencies: ["UnderKeyboard"], path: "UnderKeyboardTests")
    ],
    swiftLanguageVersions: [.v5]
)