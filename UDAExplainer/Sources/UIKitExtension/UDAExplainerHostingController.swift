//
//  UDAExplainerHostingController.swift
//  UDAExplainer
//
//  Created by Kjuly on 13/6/2023.
//  Copyright © 2023 Kaijie Yu. All rights reserved.
//

import Foundation
import SwiftUI

public final class UDAExplainerHostingController: UIHostingController<UDAExplainerView> {

  /// The UDAExplainer type (refer to the enum `UDAExplainerType`).
  private let type: UDAExplainerType

  /// Whether this view controller can dismiss itself when received the notification of `.UDAExplainer.shouldDismissView`.
  private let isSelfDismissible: Bool

  // MARK: - Deinit

  deinit {
    if self.isSelfDismissible {
      NotificationCenter.default.removeObserver(self)
    }
  }

  // MARK: - Init

  /// Returns a UIKit view controller with a UDAExplainerView instance hosted.
  ///
  /// - Parameters:
  ///   - config: The configuration for the explainer view.
  ///   - isSelfDismissible: Whether this view controller can dismiss itself when received
  ///     the notification of `.UDAExplainer.shouldDismissView`. Default: true.
  ///
  /// - Important: If set "isSelfDismissible = false", please remember to observe
  ///   the `Notification.Name.UDAExplainer.shouldDismissView` to dismiss the view controller
  ///   appropriately.
  ///
  public init(
    with config: UDAExplainerConfiguration,
    isSelfDismissible: Bool = true
  ) {
    self.type = config.type
    self.isSelfDismissible = isSelfDismissible

    super.init(rootView: UDAExplainerView(config: config, isHosted: true))

    self.view.backgroundColor = UIColor(config.colorSet.background)
    self.modalPresentationStyle = .fullScreen
    self.modalTransitionStyle = .crossDissolve

    if isSelfDismissible {
      NotificationCenter.default.addObserver(
        self,
        selector: #selector(_handleUDAExplainerShouldDismissViewNotification),
        name: .UDAExplainer.shouldDismissView,
        object: nil)
    }
  }

  public required init?(coder aDecoder: NSCoder) {
    fatalError()
  }

  // MARK: - Private

  @objc private func _handleUDAExplainerShouldDismissViewNotification(_ note: Notification) {
    guard
      let expectedType = note.object as? UDAExplainerType,
      expectedType == self.type
    else {
      return
    }
    NotificationCenter.default.removeObserver(self, name: .UDAExplainer.shouldDismissView, object: nil)

    self.dismiss(animated: true)
  }
}
