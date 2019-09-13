// swift-tools-version:5.0
import PackageDescription

#if canImport(Compression)
let targets: [Target] = [
    .target(name: "ZIPFoundation"),
    .testTarget(name: "ZIPFoundationTests", dependencies: ["ZIPFoundation"])
]
#else
let targets: [Target] = [
    .systemLibrary(name: "CZLib", pkgConfig: "zlib", providers: [.brew(["zlib"]), .apt(["zlib"])]),
    .target(name: "ZIPFoundation", target: .dynamic, dependencies: ["CZLib"]),
    .testTarget(name: "ZIPFoundationTests", dependencies: ["ZIPFoundation"])
]
#endif

let package = Package(
    name: "ZIPFoundation",
    platforms: [
        .macOS(.v10_11), .iOS(.v11), .tvOS(.v9), .watchOS(.v2)
    ],
    products: [
        .library(name: "ZIPFoundation", type: .dynamic, targets: ["ZIPFoundation"])
    ],
    targets: targets,
    swiftLanguageVersions: [.v5]
)
