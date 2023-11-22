//
//  UDAExplainerView.swift
//  UDAExplainer
//
//  Created by Kaijie Yu on 20/4/2023.
//  Copyright © 2023 Kaijie Yu. All rights reserved.
//

import Foundation
import SwiftUI

// MARK: - Notification Name

extension Notification.Name {

  public enum UDAExplainer {

    /// Notify the app that user pressed the "Continue" button, need to handle it appropriately.
    ///
    /// Observe this notification at the place where you present the explainer view.
    ///
    public static let shouldContinue = Notification.Name("com.kjuly.UDAExplainer.ShouldContinue")

    /// Notify the explainer view to dismiss itself.
    ///
    /// Post this notification when you've done the user data access authorisation.
    ///
    public static let shouldDismissView = Notification.Name("com.kjuly.UDAExplainer.ShouldDismissView")
  }
}

// MARK: - UDAExplainerView

public struct UDAExplainerView: View {

  /// Explainer configuration.
  private let config: UDAExplainerConfiguration
  /// Whether the explainer view is hosted by a UIHostingController (typically for the UIKit usage).
  private let isHosted: Bool

  @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
  @Environment(\.dismiss) var dismiss

  // MARK: - Init

  /// Init a UDAExplainerView instance.
  ///
  /// - Parameters:
  ///   - config: The configuration for the explainer view.
  ///   - isHosted: Whether the explainer view is hosted by a UIHostingController
  ///     (typically for the UIKit usage). Default: false.
  public init(
    config: UDAExplainerConfiguration,
    isHosted: Bool = false
  ) {
    self.config = config
    self.isHosted = isHosted
  }

  // MARK: - View

  public var body: some View {
    if self.isHosted {
      _contentView()
    } else {
      _contentView().onReceive(
        NotificationCenter.default.publisher(for: .UDAExplainer.shouldDismissView)
      ) { note in
        if
          let expectedType = note.object as? UDAExplainerType,
          expectedType == self.config.type
        {
          self.dismiss()
        }
      }
    }
  }

  @ViewBuilder
  func _contentView() -> some View {
    ZStack {
      Color(uiColor: UIColor(self.config.colorSet.background))
        .ignoresSafeArea()

      if self.config.isCompactDevice {
        _scrollView()
      } else {
        _scrollView().frame(maxWidth: 600, maxHeight: 970)
      }
    }
  }

  @ViewBuilder
  func _scrollView() -> some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .leading, spacing: 0) {
        Text(self.config.title)
          .font(.largeTitle)
          .foregroundColor(self.config.colorSet.defaultContent)
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.bottom, KYUDAExplainerUIDimension.padding_20)

        ForEach(self.config.detailItems) { item in
          _detailItemView(for: item)
        }
        Spacer()
      }
      .padding(
        EdgeInsets(
          top: KYUDAExplainerUIDimension.defaultScreenEdgePaddingInVertical,
          leading: KYUDAExplainerUIDimension.padding_20,
          bottom: KYUDAExplainerUIDimension.defaultScreenEdgePaddingInVertical,
          trailing: KYUDAExplainerUIDimension.defaultScreenEdgePaddingInHorizontal)
      )
    }
    .uda_hideScrollContentBackground()
    .safeAreaInset(edge: .bottom, alignment: .center) {
      _bottomContentView()
    }
  }

  // MARK: - Private (Detail Item View)

  @ViewBuilder
  func _detailItemView(for item: UDAExplainerDetailItem) -> some View {
    HStack(alignment: .center, spacing: KYUDAExplainerUIDimension.padding_20) {
      if self.config.isCompactDevice && self.verticalSizeClass == .compact { // iPhone Landscape
        Image(systemName: item.iconName)
          .imageScale(.large)
      } else {
        Image(systemName: item.iconName)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 32, height: 32, alignment: .center)
      }
      Text(item.title)
        .font(.title)
    }
    .foregroundColor(self.config.colorSet.defaultContent)
    .padding(.all, KYUDAExplainerUIDimension.padding_10)

    if let subtitle = item.subtitle {
      Text(subtitle)
        .font(.subheadline)
        .foregroundColor(self.config.colorSet.secondaryContent)
        .padding(.horizontal, KYUDAExplainerUIDimension.padding_10)
    }
  }

  // MARK: - Private (Bottom Content View)

  @ViewBuilder
  private func _declareMessageLabel() -> some View {
    HStack(alignment: .center, spacing: KYUDAExplainerUIDimension.padding_15) {
      if let declareIconName = self.config.declareIconName {
        Image(systemName: declareIconName).foregroundColor(self.config.colorSet.green)
      }
      Text(self.config.declareText)
        .font(.body)
        .foregroundColor(self.config.colorSet.defaultContent)
    }
  }

  @ViewBuilder
  private func _bottomContentView() -> some View {
    VStack(alignment: .center, spacing: 0) {
      if !self.config.declareText.isEmpty {
        _declareMessageLabel()
          .padding(.all, KYUDAExplainerUIDimension.padding_15)

        Divider().overlay(self.config.colorSet.separator)
      }

      VStack(alignment: .center, spacing: KYUDAExplainerUIDimension.padding_10) {
        //
        // Continue - Button
        Button {
          NotificationCenter.default.post(
            name: .UDAExplainer.shouldContinue,
            object: self.config.type)
        } label: {
          Text(self.config.continueButtonTitle)
            .fontWeight(.medium)
            .foregroundColor(self.config.colorSet.textOverAccent)
            .frame(height: KYUDAExplainerUIDimension.continueButtonHeight)
            .frame(maxWidth: .infinity)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .background(
          Capsule(style: .continuous).fill(self.config.colorSet.accent)
        )
        //
        // Footnote
        Text(self.config.footnote)
          .multilineTextAlignment(.center)
          .font(.footnote)
          .foregroundColor(self.config.colorSet.secondaryContent)
      }
      .padding(.all, KYUDAExplainerUIDimension.padding_15)
    }
  }
}

#if DEBUG
struct UDAExplainerView_Previews: PreviewProvider {
  static var previews: some View {
    let previewDeviceName = "iPhone 15 Pro Max"
//    let previewDeviceName = "iPad Pro (12.9-inch)"

    let config = UDAExplainerDefaultDataSource.configuration(
      for: .userTracking,
      inCompactDevice: previewDeviceName.hasPrefix("iPhone"))

    UDAExplainerView(config: config, isHosted: false)
      .previewDevice(PreviewDevice(rawValue: previewDeviceName))
  }
}
#endif
