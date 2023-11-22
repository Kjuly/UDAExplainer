//
//  DemoPrivacyAuthorizer+LocalNetwork.swift
//  UDAExplainerDemo
//
//  Created by Kjuly on 18/11/2023.
//  Copyright © 2023 Kaijie Yu. All rights reserved.
//

import Foundation

extension DemoPrivacyAuthorizer {

  public static func localNetwork_authorizationStatusText() -> String? {
    // Currently, there's no func available (like `ATTrackingManager.trackingAuthorizationStatus == .notDetermined`)
    //   to determine whether user authorized before.
    //
    // You can store a flag in the UserDefaults to make sure the explainer won't be
    //   shown next time.
    //
    return nil
  }

  public static func localNetwork_requestAuthorization() {
    // The local network authorization alert will be triggered once there's some outgoing traffic.
    //   You can generate some dummy outgoing traffic in order to trigger this alert.
    //
    // Just make sure the explainer has been presented before the first outgoing traffic that made.
    //
    didCompleteAuthorization(for: .localNetwork)
  }
}
