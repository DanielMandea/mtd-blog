// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "mtd-blog",
    dependencies: [
      .package(url: "https://github.com/IBM-Swift/Kitura.git", .upToNextMinor(from: "2.7.0")),
      .package(url: "https://github.com/IBM-Swift/HeliumLogger.git", from: "1.7.1"),
      .package(url: "https://github.com/IBM-Swift/CloudEnvironment.git", from: "9.0.0"),
      .package(url: "https://github.com/RuntimeTools/SwiftMetrics.git", from: "2.0.0"),
      .package(url: "https://github.com/IBM-Swift/Kitura-OpenAPI.git", from: "1.0.0"),
      .package(url: "https://github.com/IBM-Swift/Health.git", from: "1.0.0"),
      .package(url: "https://github.com/IBM-Swift/Kitura-StencilTemplateEngine.git", from: "1.10.0"),
      .package(url: "https://github.com/IBM-Swift/Kitura-CouchDB.git", from: "3.1.1"),
      .package(url: "https://github.com/mxcl/PromiseKit.git", from: "6.8.4"),
      .package(url: "https://github.com/IBM-Swift/FileKit.git", from: "0.0.2"),
      .package(url: "https://github.com/IBM-Swift/Kitura-Markdown.git", from: "1.0.0"),
      .package(url: "https://github.com/DanielMandea/mtd-blog-components.git", from: "0.0.6"),
      .package(url: "https://github.com/DanielMandea/bluemix-objectstorage-serversdk-swift.git", .branch("master"))
    ],
    targets: [
        .target(name: "mtd-blog", dependencies: [ .target(name: "Application"), "Kitura" , "HeliumLogger", "KituraStencil", "CouchDB", "PromiseKit", "FileKit"]),
        .target(name: "Application", dependencies: [ "Kitura", "CloudEnvironment","SwiftMetrics", "Health", "KituraStencil", "CouchDB", "PromiseKit", "FileKit", "KituraMarkdown", "MTDBlogComponents", "BluemixObjectStorage"]),
        .testTarget(name: "ApplicationTests" , dependencies: [.target(name: "Application"), "Kitura","HeliumLogger", "KituraStencil", "PromiseKit", "mtd-blog"])
    ]
)
