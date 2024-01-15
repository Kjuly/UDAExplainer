//
//  UDAExplainerDefaultDataSourceTests.swift
//  UDAExplainerTests
//
//  Created by Kjuly on 24/6/2023.
//  Copyright © 2023 Kaijie Yu. All rights reserved.
//

import XCTest
@testable import UDAExplainer

final class UDAExplainerDefaultDataSourceTests: XCTestCase {

  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  //
  // UDAExplainerDefaultDataSource.uda_explainerConfiguration(for:inCompactDevice:)
  // static UDAExplainerDefaultDataSource.configuration(for:inCompactDevice:)
  //
  func testExplainerConfiguration() throws { // swiftlint:disable:this function_body_length
    let dataSource = UDAExplainerDefaultDataSource()
    var config: UDAExplainerConfiguration

    //
    // Local Network
    config = dataSource.uda_explainerConfiguration(for: .localNetwork, inCompactDevice: false)
    XCTAssertEqual(config.type, UDAExplainerType.localNetwork)
    XCTAssertEqual(config.title, "Allow local network usage on the next screen for:")
    XCTAssertEqual(config.declareIconName, "checkmark.shield.fill")
    XCTAssertEqual(config.declareText, "We will not surreptitiously access your local devices.")
    XCTAssertEqual(config.continueButtonTitle, "Continue")
    XCTAssertEqual(config.footnote, "You can change this option later in the Settings app.\n(The settings option is \"Local Network\".)")
    XCTAssertEqual(config.isCompactDevice, false)

    //
    // User Tracking
    config = dataSource.uda_explainerConfiguration(for: .userTracking, inCompactDevice: true)
    XCTAssertEqual(config.type, UDAExplainerType.userTracking)
    XCTAssertEqual(config.title, "Allow tracking on the next screen for:")
    XCTAssertEqual(config.declareIconName, "checkmark.shield.fill")
    XCTAssertEqual(config.declareText, "We will not obtain your data stored inner App, let alone share them with any third party.")
    XCTAssertEqual(config.continueButtonTitle, "Continue")
    XCTAssertEqual(config.footnote, "You can change this option later in the Settings app.\n(The settings option is \"Allow Tracking\".)")
    XCTAssertEqual(config.isCompactDevice, true)

    //
    // Face ID
    config = dataSource.uda_explainerConfiguration(for: .faceID, inCompactDevice: true)
    XCTAssertEqual(config.type, UDAExplainerType.faceID)
    XCTAssertEqual(config.title, "Allow Face ID usage on the next screen for:")
    XCTAssertEqual(config.declareIconName, "checkmark.shield.fill")
    XCTAssertEqual(config.declareText, "")
    XCTAssertEqual(config.continueButtonTitle, "Continue")
    XCTAssertEqual(config.footnote, "You can change this option later in the Settings app.\n(The settings option is \"Face ID\".)")
    XCTAssertEqual(config.isCompactDevice, true)

    //
    // Camera
    config = dataSource.uda_explainerConfiguration(for: .camera, inCompactDevice: true)
    XCTAssertEqual(config.type, UDAExplainerType.camera)
    XCTAssertEqual(config.title, "Allow camera usage on the next screen for:")
    XCTAssertEqual(config.declareIconName, "checkmark.shield.fill")
    XCTAssertEqual(config.declareText, "We will not surreptitiously turn on the camera.")
    XCTAssertEqual(config.continueButtonTitle, "Continue")
    XCTAssertEqual(config.footnote, "You can change this option later in the Settings app.\n(The settings option is \"Camera\".)")
    XCTAssertEqual(config.isCompactDevice, true)

    //
    // Photo Library
    config = dataSource.uda_explainerConfiguration(for: .photoLibrary, inCompactDevice: true)
    XCTAssertEqual(config.type, UDAExplainerType.photoLibrary)
    XCTAssertEqual(config.title, "Allow Photo Library usage on the next screen for:")
    XCTAssertEqual(config.declareIconName, "checkmark.shield.fill")
    XCTAssertEqual(config.declareText, "We will not surreptitiously scan your photos.")
    XCTAssertEqual(config.continueButtonTitle, "Continue")
    XCTAssertEqual(config.footnote, "You can change this option later in the Settings app.\n(The settings option is \"Photos\".)")
    XCTAssertEqual(config.isCompactDevice, true)

    //
    // Photo Library Add To Custom Album
    config = dataSource.uda_explainerConfiguration(for: .photoLibraryAddToCustomAlbum, inCompactDevice: true)
    XCTAssertEqual(config.type, UDAExplainerType.photoLibraryAddToCustomAlbum)
    XCTAssertEqual(config.title, "Allow Photo Library usage on the next screen for:")
    XCTAssertEqual(config.declareIconName, "checkmark.shield.fill")
    XCTAssertEqual(config.declareText, "We will not surreptitiously scan your photos.")
    XCTAssertEqual(config.continueButtonTitle, "Continue")
    XCTAssertEqual(config.footnote, "You can change this option later in the Settings app.\n(The settings option is \"Photos\".)")
    XCTAssertEqual(config.isCompactDevice, true)

    //
    // Photo Library Add Only
    config = dataSource.uda_explainerConfiguration(for: .photoLibraryAddOnly, inCompactDevice: true)
    XCTAssertEqual(config.type, UDAExplainerType.photoLibraryAddOnly)
    XCTAssertEqual(config.title, "Allow Photo Library usage on the next screen for:")
    XCTAssertEqual(config.declareIconName, "checkmark.shield.fill")
    XCTAssertEqual(config.declareText, "We will not surreptitiously scan your photos.")
    XCTAssertEqual(config.continueButtonTitle, "Continue")
    XCTAssertEqual(config.footnote, "You can change this option later in the Settings app.\n(The settings option is \"Photos\".)")
    XCTAssertEqual(config.isCompactDevice, true)

    //
    // Apple Music
    config = dataSource.uda_explainerConfiguration(for: .appleMusic, inCompactDevice: true)
    XCTAssertEqual(config.type, UDAExplainerType.appleMusic)
    XCTAssertEqual(config.title, "Allow Media & Apple Music usage on the next screen for:")
    XCTAssertEqual(config.declareIconName, "checkmark.shield.fill")
    XCTAssertEqual(config.declareText, "We will not surreptitiously scan your media and music.")
    XCTAssertEqual(config.continueButtonTitle, "Continue")
    XCTAssertEqual(config.footnote, "You can change this option later in the Settings app.\n(The settings option is \"Media & Apple Music\".)")
    XCTAssertEqual(config.isCompactDevice, true)

    // Detail Items
//    let detailItems: [UDAExplainerDetailItem] = detailItems(for: type)

  }

  //
  // static UDAExplainerDefaultDataSource.detailItems(for:)
  //
  func testDetailItems() throws { // swiftlint:disable:this function_body_length
    // swiftlint:disable line_length
    var detailItems: [UDAExplainerDetailItem]

    //
    // Local Network
    detailItems = UDAExplainerDefaultDataSource.detailItems(for: .localNetwork)
    XCTAssertEqual(detailItems.count, 1)
    XCTAssertEqual(detailItems[0],
                   UDAExplainerDetailItem(
                    iconName: "",
                    title: "",
                    subtitle: ""))

    //
    // User Tracking
    detailItems = UDAExplainerDefaultDataSource.detailItems(for: .userTracking)
    XCTAssertEqual(detailItems.count, 1)
    XCTAssertEqual(detailItems[0],
                   UDAExplainerDetailItem(
                    iconName: "heart.circle.fill",
                    title: "Advertisements that match your interests",
                    subtitle: "Ads help support our further development. Tap \"Allow\" on the following popup message to give permission to show ads that are more relevant to you."))

    //
    // Face ID
    detailItems = UDAExplainerDefaultDataSource.detailItems(for: .faceID)
    XCTAssertEqual(detailItems.count, 1)
    XCTAssertEqual(detailItems[0],
                   UDAExplainerDetailItem(
                    iconName: "faceid",
                    title: "App unlocking",
                    subtitle: "Tap \"OK\" on the following popup message to give permission to use Face ID to unlock the app that's in auto-locked status."))

    //
    // Camera
    detailItems = UDAExplainerDefaultDataSource.detailItems(for: .camera)
    XCTAssertEqual(detailItems.count, 1)
    XCTAssertEqual(detailItems[0],
                   UDAExplainerDetailItem(
                    iconName: "camera.aperture",
                    title: "Taking photos",
                    subtitle: "Tap \"OK\" on the following popup message to give permission to use the Camera to take photos."))

    //
    // Photo Library
    detailItems = UDAExplainerDefaultDataSource.detailItems(for: .photoLibrary)
    XCTAssertEqual(detailItems.count, 1)
    XCTAssertEqual(detailItems[0],
                   UDAExplainerDetailItem(
                    iconName: "photo.stack",
                    title: "Photos selection",
                    subtitle: "Tap \"Select Photos...\" or \"Allow Access to All Photos\" on the following popup message to give permission to list available photos for selection."))

    //
    // Photo Library Add To Custom Album
    detailItems = UDAExplainerDefaultDataSource.detailItems(for: .photoLibraryAddToCustomAlbum)
    XCTAssertEqual(detailItems.count, 2)
    XCTAssertEqual(detailItems[0],
                   UDAExplainerDetailItem(
                    iconName: "photo.circle",
                    title: "Looking for the custom album",
                    subtitle: nil))
    XCTAssertEqual(detailItems[1],
                   UDAExplainerDetailItem(
                    iconName: "rectangle.stack.badge.plus",
                    title: "Saving photos",
                    subtitle: "Tap \"Select Photos...\" (you can select none) or \"Allow Access to All Photos\" on the following popup message to give permission to look for the custom album and save photos there."))

    //
    // Photo Library Add Only
    detailItems = UDAExplainerDefaultDataSource.detailItems(for: .photoLibraryAddOnly)
    XCTAssertEqual(detailItems.count, 1)
    XCTAssertEqual(detailItems[0],
                   UDAExplainerDetailItem(
                    iconName: "rectangle.stack.badge.plus",
                    title: "Saving photos",
                    subtitle: "Tap \"OK\" on the following popup message to give permission to save photos to the Photos album."))

    //
    // Apple Music
    detailItems = UDAExplainerDefaultDataSource.detailItems(for: .appleMusic)
    XCTAssertEqual(detailItems.count, 1)
    XCTAssertEqual(detailItems[0],
                   UDAExplainerDetailItem(
                    iconName: "",
                    title: "",
                    subtitle: ""))

    // swiftlint:enable line_length
  }
}
