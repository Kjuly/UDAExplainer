//
//  DemoPrivacyAuthorizer+AppleMusic.swift
//  UDAExplainerDemo
//
//  Created by Kjuly on 18/11/2023.
//  Copyright © 2023 Kaijie Yu. All rights reserved.
//

import Foundation
import MediaPlayer

extension DemoPrivacyAuthorizer {

  public static func appleMusic_authorizationStatusText() -> String? {
    switch MPMediaLibrary.authorizationStatus() {
    case .notDetermined: return nil
    case .denied: return "Denied"
    case .restricted: return "Restricted"
    case .authorized: return "Authorized"
    default:
      return "Unknown"
    }
  }

  public static func appleMusic_requestAuthorization() {
    MPMediaLibrary.requestAuthorization { _ in
      didCompleteAuthorization(for: .appleMusic)
    }
  }
}
