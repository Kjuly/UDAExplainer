//
//  DemoPrivacyAuthorizer+Camera.swift
//  UDAExplainerDemo
//
//  Created by Kjuly on 18/11/2023.
//  Copyright © 2023 Kaijie Yu. All rights reserved.
//

import Foundation
import AVFoundation

extension DemoPrivacyAuthorizer {

  public static func camera_authorizationStatusText() -> String? {
    switch AVCaptureDevice.authorizationStatus(for: .video) {
    case .notDetermined: return nil
    case .restricted: return "Restricted"
    case .denied: return "Denied"
    case .authorized: return "Authorized"
    default:
      return "Unknown"
    }
  }

  public static func camera_requestAuthorization() {
    AVCaptureDevice.requestAccess(for: .video) { _ in
      didCompleteAuthorization(for: .camera)
    }
  }
}
