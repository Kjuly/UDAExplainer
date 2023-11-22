//
//  DemoPrivacyAuthorizer.swift
//  UDAExplainerDemo
//
//  Created by Kjuly on 18/11/2023.
//  Copyright © 2023 Kaijie Yu. All rights reserved.
//

import UIKit
import UDAExplainer

public class DemoPrivacyAuthorizer {

  public class func authorizationStatusText(for type: UDAExplainerType) -> String? {
    switch type {
    case .localNetwork: return localNetwork_authorizationStatusText()
    case .userTracking: return userTracking_authorizationStatusText()
    case .faceID: return faceID_authorizationStatusText()
    case .camera: return camera_authorizationStatusText()
    case .photoLibrary, .photoLibraryAddOnly, .photoLibraryAddToCustomAlbum: return photoLibrary_authorizationStatusText(for: type)
    case .appleMusic: return appleMusic_authorizationStatusText()
    }
  }

  public class func requestAuthorisation(for type: UDAExplainerType) {
    switch type {
    case .localNetwork: localNetwork_requestAuthorization()
    case .userTracking: userTracking_requestAuthorization()
    case .faceID: faceID_requestAuthorization()
    case .camera: camera_requestAuthorization()
    case .photoLibrary, .photoLibraryAddOnly, .photoLibraryAddToCustomAlbum: photoLibrary_requestAuthorization(for: type)
    case .appleMusic: appleMusic_requestAuthorization()
    }
  }

  class func didCompleteAuthorization(for type: UDAExplainerType) {
    DispatchQueue.main.async {
      NotificationCenter.default.post(name: .UDAExplainer.shouldDismissView, object: type)
    }
  }
}
