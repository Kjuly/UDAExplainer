// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "UDAExplainer",
  defaultLocalization: "en",
  platforms: [
    .iOS("15.5"),
  ],
  products: [
    .library(
      name: "UDAExplainer",
      targets: [
        "UDAExplainer",
      ]),
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "UDAExplainer",
      dependencies: [
      ],
      path: "UDAExplainer/Sources",
      resources: [
        .process("Resources/"),
      ]),
    .testTarget(
      name: "UDAExplainerTests",
      dependencies: [
        "UDAExplainer",
      ],
      path: "UDAExplainerTests"),
  ]
)
