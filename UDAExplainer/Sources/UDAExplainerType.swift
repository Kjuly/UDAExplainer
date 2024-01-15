//
//  UDAExplainerType.swift
//  UDAExplainer
//
//  Created by Kjuly on 12/6/2023.
//  Copyright © 2023 Kaijie Yu. All rights reserved.
//

import Foundation

/// User data access explainer type.
///
/// REF: [Protected resources](https://developer.apple.com/documentation/bundleresources/information_property_list/protected_resources)
///
public enum UDAExplainerType: Int, Identifiable, CaseIterable {

  public var id: Self {
    return self
  }

  /// Local Network Usage (NSLocalNetworkUsageDescription).
  ///
  /// For a message that tells the user why the app is requesting access to the local network.
  ///
  case localNetwork

  /// User Tracking Usage (IDFA: Identifier for Advertisers, NSUserTrackingUsageDescription).
  ///
  /// For a message that informs the user why an app is requesting permission to use data for
  ///   tracking the user or the device.
  ///
  case userTracking

  /// Biometry - Face ID (NSFaceIDUsageDescription).
  ///
  /// A message that tells the user why the app is requesting the ability to authenticate with Face ID.
  ///
  case faceID

  /// Camera Usage (NSCameraUsageDescription).
  ///
  /// For a message that tells the user why the app is requesting access to the device’s camera.
  ///
  case camera

  /// Photo Library Usage (NSPhotoLibraryUsageDescription).
  ///
  /// For a message that tells the user why the app is requesting access to the user’s photo library.
  ///
  /// If your app only adds assets to the photo library and does not read assets,
  ///   use the `photoLibraryAddOnly` (`NSPhotoLibraryAddUsageDescription`) instead.
  ///
  /// > There's no need to request the authorisation if you use PHPickerViewController or UIImagePickerController
  /// >   to present photos for selection.
  /// >
  /// > As doc ["Selecting Photos and Videos in iOS"](https://developer.apple.com/documentation/photokit/selecting_photos_and_videos_in_ios) said:
  /// >
  /// > Both PHPickerViewController and UIImagePickerController use the out-of-process Photos
  /// >   picker user interface.
  /// >
  /// > Apps don’t need to request photo library permission when using either class, so the sample
  /// >   app avoids requesting permission until it’s necessary. A camera app, photo editing app,
  /// >   or library browsing app needs to use much more of PhotoKit’s functionality, but an app
  /// >   that’s only setting a basic profile photo doesn’t need photo library permission. An app
  /// >   that only saves photos to the photo library can use the Add Photos Only permission level
  /// >   when requesting authorization.
  ///
  case photoLibrary

  /// Photo Library Usage for Saving to Custom Album (NSPhotoLibraryUsageDescription).
  ///
  /// For a message that tells the user why the app is requesting access to the user’s photo library.
  ///
  /// Looking for the custom album needs the "read" permission as well as the "write". So the access
  ///   permission should be the same to the `photoLibrary`, but with a different details description.
  ///
  /// If your app only adds assets to the photo library and does not read assets,
  ///   use the `photoLibraryAddOnly` (`NSPhotoLibraryAddUsageDescription`) instead.
  ///
  case photoLibraryAddToCustomAlbum

  /// Photo Library Add Usage (NSPhotoLibraryAddUsageDescription).
  ///
  /// For a message that tells the user why the app is requesting add-only access to the user’s photo library.
  ///
  case photoLibraryAddOnly

  /// Apple Music Usage (Media & Apple Music, NSAppleMusicUsageDescription).
  ///
  /// For a message that tells the user why the app is requesting access to the user’s media library.
  ///
  case appleMusic

  // MARK: - Key

  /// A string key that stands for a UDAExplainerType option.
  public var key: String {
    switch self {
    case .localNetwork: return "LocalNetwork"
    case .userTracking: return "UserTracking"
    case .faceID: return "FaceID"
    case .camera: return "Camera"
    case .photoLibrary: return "PhotoLibrary"
    case .photoLibraryAddToCustomAlbum: return "PhotoLibraryAddToCustomAlbum"
    case .photoLibraryAddOnly: return "PhotoLibraryAddOnly"
    case .appleMusic: return "AppleMusic"
    }
  }

  // MARK: - Convenient Getter

  /// Explainer type's localized usage name by default.
  ///
  /// It's used for the default title format: "Allow ? on the next screen for:".
  ///
  /// e.g.: "camera usage", "local network usage", "tracking", etc.
  ///
  public var defaultLocalizedUsageName: String {
    return "\(self.key):UsageName".uda_explainerLocalized
  }

  /// Explainer type's localized declare text by default.
  public var defaultLocalizedDeclare: String {
    return "\(self.key):Declare".uda_explainerLocalized
  }

  /// Explainer type's localized settings option name in the device's Settings app.
  public var localizedSettingsOptionName: String {
    return "\(self.key):SettingsOption".uda_explainerLocalized
  }
}
