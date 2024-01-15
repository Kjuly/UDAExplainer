//
//  UDAExplainerTypeTests.swift
//  UDAExplainerTests
//
//  Created by Kjuly on 12/6/2023.
//  Copyright © 2023 Kaijie Yu. All rights reserved.
//

import XCTest
@testable import UDAExplainer

final class UDAExplainerTypeTests: XCTestCase {

  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  //
  // UDAExplainerType.getter:key
  //
  func testKey() throws {
    XCTAssertEqual(UDAExplainerType.localNetwork.key, "LocalNetwork")
    XCTAssertEqual(UDAExplainerType.userTracking.key, "UserTracking")
    XCTAssertEqual(UDAExplainerType.faceID.key, "FaceID")
    XCTAssertEqual(UDAExplainerType.camera.key, "Camera")
    XCTAssertEqual(UDAExplainerType.photoLibrary.key, "PhotoLibrary")
    XCTAssertEqual(UDAExplainerType.photoLibraryAddToCustomAlbum.key, "PhotoLibraryAddToCustomAlbum")
    XCTAssertEqual(UDAExplainerType.photoLibraryAddOnly.key, "PhotoLibraryAddOnly")
    XCTAssertEqual(UDAExplainerType.appleMusic.key, "AppleMusic")
  }

  //
  // UDAExplainerType.getter:defaultLocalizedUsageName
  //
  func testdefaultLocalizedUsageName() {
    XCTAssertEqual(UDAExplainerType.localNetwork.defaultLocalizedUsageName, "local network usage")
    XCTAssertEqual(UDAExplainerType.userTracking.defaultLocalizedUsageName, "tracking")
    XCTAssertEqual(UDAExplainerType.faceID.defaultLocalizedUsageName, "Face ID usage")
    XCTAssertEqual(UDAExplainerType.camera.defaultLocalizedUsageName, "camera usage")
    XCTAssertEqual(UDAExplainerType.photoLibrary.defaultLocalizedUsageName, "Photo Library usage")
    XCTAssertEqual(UDAExplainerType.photoLibraryAddToCustomAlbum.defaultLocalizedUsageName, "Photo Library usage")
    XCTAssertEqual(UDAExplainerType.photoLibraryAddOnly.defaultLocalizedUsageName, "Photo Library usage")
    XCTAssertEqual(UDAExplainerType.appleMusic.defaultLocalizedUsageName, "Media & Apple Music usage")
  }

  //
  // UDAExplainerType.getter:defaultLocalizedDeclare
  //
  func testDefaultLocalizedDeclare() {
    // swiftlint:disable line_length
    XCTAssertEqual(UDAExplainerType.localNetwork.defaultLocalizedDeclare, "We will not surreptitiously access your local devices.")
    XCTAssertEqual(UDAExplainerType.userTracking.defaultLocalizedDeclare, "We will not obtain your data stored inner App, let alone share them with any third party.")
    XCTAssertEqual(UDAExplainerType.faceID.defaultLocalizedDeclare, "")
    XCTAssertEqual(UDAExplainerType.camera.defaultLocalizedDeclare, "We will not surreptitiously turn on the camera.")
    XCTAssertEqual(UDAExplainerType.photoLibrary.defaultLocalizedDeclare, "We will not surreptitiously scan your photos.")
    XCTAssertEqual(UDAExplainerType.photoLibraryAddToCustomAlbum.defaultLocalizedDeclare, "We will not surreptitiously scan your photos.")
    XCTAssertEqual(UDAExplainerType.photoLibraryAddOnly.defaultLocalizedDeclare, "We will not surreptitiously scan your photos.")
    XCTAssertEqual(UDAExplainerType.appleMusic.defaultLocalizedDeclare, "We will not surreptitiously scan your media and music.")
    // swiftlint:enable line_length
  }

  //
  // UDAExplainerType.getter:localizedSettingsOptionName
  //
  func testLocalizedSettingsOptionName() {
    XCTAssertEqual(UDAExplainerType.localNetwork.localizedSettingsOptionName, "Local Network")
    XCTAssertEqual(UDAExplainerType.userTracking.localizedSettingsOptionName, "Allow Tracking")
    XCTAssertEqual(UDAExplainerType.faceID.localizedSettingsOptionName, "Face ID")
    XCTAssertEqual(UDAExplainerType.camera.localizedSettingsOptionName, "Camera")
    XCTAssertEqual(UDAExplainerType.photoLibrary.localizedSettingsOptionName, "Photos")
    XCTAssertEqual(UDAExplainerType.photoLibraryAddToCustomAlbum.localizedSettingsOptionName, "Photos")
    XCTAssertEqual(UDAExplainerType.photoLibraryAddOnly.localizedSettingsOptionName, "Photos")
    XCTAssertEqual(UDAExplainerType.appleMusic.localizedSettingsOptionName, "Media & Apple Music")
  }
}
