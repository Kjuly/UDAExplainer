//
//  DemoPrivacyAuthorizer+UserTracking.swift
//  UDAExplainerDemo
//
//  Created by Kjuly on 18/11/2023.
//  Copyright © 2023 Kaijie Yu. All rights reserved.
//

import Foundation
import AppTrackingTransparency

extension DemoPrivacyAuthorizer {

  public static func userTracking_authorizationStatusText() -> String? {
    switch ATTrackingManager.trackingAuthorizationStatus {
    case .notDetermined: return nil
    case .restricted: return "Restricted"
    case .denied: return "Denied"
    case .authorized: return "Authorized"
    default:
      return "Unknown"
    }
  }

  public static func userTracking_requestAuthorization() {
    ATTrackingManager.requestTrackingAuthorization { _ in
      didCompleteAuthorization(for: .userTracking)
    }
  }
}
