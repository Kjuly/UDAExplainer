//
//  DemoPrivacyAuthorizer+PhotoLibrary.swift
//  UDAExplainerDemo
//
//  Created by Kjuly on 18/11/2023.
//  Copyright © 2023 Kaijie Yu. All rights reserved.
//

import Foundation
import Photos
import UDAExplainer

extension DemoPrivacyAuthorizer {

  public static func photoLibrary_accessLevel(for type: UDAExplainerType) -> PHAccessLevel {
    if type == .photoLibraryAddOnly {
      return .addOnly
    } else if type == .photoLibraryAddToCustomAlbum {
      return .readWrite
    } else {
      //
      // Note: For type == .photoLibrary, there's no need to request the authorisation if you use
      //   PHPickerViewController or UIImagePickerController to present photos for selection.
      //
      // But it's still a good practice to let user know about it.
      //
      // So there's no need to request authorization when user press "Continue" in explainer,
      //   you can just store a flag in the UserDefaults to make sure the explainer won't be
      //   shown next time.
      //
      return .addOnly
    }
  }

  public static func photoLibrary_authorizationStatusText(for type: UDAExplainerType) -> String? {
    if type == .photoLibrary {
      return nil
    }

    let accessLevel: PHAccessLevel = photoLibrary_accessLevel(for: type)
    switch PHPhotoLibrary.authorizationStatus(for: accessLevel) {
    case .notDetermined: return nil
    case .restricted: return "Restricted"
    case .denied: return "Denied"
    case .authorized: return "Authorized"
    case .limited: return "Limited"
    default:
      return "Unknown"
    }
  }

  public static func photoLibrary_requestAuthorization(for type: UDAExplainerType) {
    if type == .photoLibrary {
      didCompleteAuthorization(for: type)
      return
    }

    let accessLevel: PHAccessLevel = photoLibrary_accessLevel(for: type)
    PHPhotoLibrary.requestAuthorization(for: accessLevel) { _ in
      didCompleteAuthorization(for: type)
    }
  }
}
