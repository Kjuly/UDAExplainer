//
//  DemoPrivacyAuthorizer+FaceID.swift
//  UDAExplainerDemo
//
//  Created by Kjuly on 18/11/2023.
//  Copyright © 2023 Kaijie Yu. All rights reserved.
//

import Foundation
import LocalAuthentication

extension DemoPrivacyAuthorizer {

  public static func faceID_authorizationStatusText() -> String? {
    // Currently, there's no func available (like `ATTrackingManager.trackingAuthorizationStatus == .notDetermined`)
    //   to determine whether user authorized before.
    //
    // You can store a flag in the UserDefaults to make sure the explainer won't be
    //   shown next time.
    //
    return nil
  }

  public static func faceID_requestAuthorization() {
    let context = LAContext()
    context.localizedFallbackTitle = "Enter Password to ..."
    context.localizedCancelTitle = "Cancel"

    var authError: NSError?
    if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
      let localizedReason: String = "Use Face ID to ..."
      context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: localizedReason) { (success, error) in
        defer {
          didCompleteAuthorization(for: .faceID)
        }

        if success {
          return
        }

        guard let la_error = error as? NSError else {
          NSLog("Unknown Error")
          return
        }

        if la_error.code == LAError.userFallback.rawValue {
          // Fallback to use password.
          return

        } else if la_error.code == LAError.userCancel.rawValue || la_error.code == LAError.systemCancel.rawValue {
          // Do noting.
          return
        }

        NSLog("\(la_error.localizedDescription)")
      }

    } else if let authError {
      NSLog("\(authError.localizedDescription)")
      didCompleteAuthorization(for: .faceID)
    }
  }
}
