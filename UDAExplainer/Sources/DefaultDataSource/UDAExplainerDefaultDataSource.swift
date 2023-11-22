//
//  UDAExplainerDefaultDataSource.swift
//  UDAExplainer
//
//  Created by Kjuly on 24/6/2023.
//  Copyright © 2023 Kaijie Yu. All rights reserved.
//

import Foundation

public class UDAExplainerDefaultDataSource {

  public init() {}

  public static func configuration(for type: UDAExplainerType, inCompactDevice: Bool) -> UDAExplainerConfiguration {
    // Title
    let title = String(format: "Shared:Title (Usage: %@)".uda_explainerLocalized, type.defaultLocalizedUsageName)

    // Detail Items
    let detailItems: [UDAExplainerDetailItem] = detailItems(for: type)

    // Declare
    var declareIconName: String?
    var declareText: String?

    if
      type == .localNetwork ||
      type == .userTracking ||
      type == .camera ||
      type == .photoLibrary ||
      type == .photoLibraryAddToCustomAlbum ||
      type == .photoLibraryAddOnly ||
      type == .appleMusic
    {
      declareIconName = "checkmark.shield.fill"
      declareText = type.defaultLocalizedDeclare
    }

    // Footnote
    let footnote = String(format: "Shared:Footnote (SettingsOption: %@)".uda_explainerLocalized, type.localizedSettingsOptionName)

    return UDAExplainerConfiguration(
      type: type,
      title: title,
      detailItems: detailItems,
      declareIconName: declareIconName,
      declareText: declareText,
      continueButtonTitle: "Continue".uda_explainerLocalized,
      footnote: footnote,
      isCompactDevice: inCompactDevice,
      colorSet: .init())
  }

  public static func detailItems(for type: UDAExplainerType) -> [UDAExplainerDetailItem] {
    if type == .photoLibraryAddToCustomAlbum {
      return [
        UDAExplainerDetailItem(
          iconName: "photo.circle",
          title: "PhotoLibraryAddToCustomAlbum:Details:Sample:1".uda_explainerLocalized,
          subtitle: nil),
        UDAExplainerDetailItem(
          iconName: "rectangle.stack.badge.plus",
          title: "PhotoLibraryAddToCustomAlbum:Details:Sample:2".uda_explainerLocalized,
          subtitle: "PhotoLibraryAddToCustomAlbum:Details:Sample:Subtitle".uda_explainerLocalized),
      ]
    }

    var iconName: String
    switch type {
    case .localNetwork: iconName = ""
    case .userTracking: iconName = "heart.circle.fill"
    case .faceID: iconName = "faceid"
    case .camera: iconName = "camera.aperture"
    case .photoLibrary:
      if #available(iOS 16.0, *) {
        iconName = "photo.stack"
      } else {
        iconName = "photo"
      }
    case .photoLibraryAddOnly: iconName = "rectangle.stack.badge.plus"
    case .appleMusic: iconName = ""
    default: iconName = ""
    }

    let key = type.key
    let title = "\(key):Details:Sample".uda_explainerLocalized
    let subtitle = "\(key):Details:Sample:Subtitle".uda_explainerLocalized

    return [UDAExplainerDetailItem(iconName: iconName, title: title, subtitle: subtitle)]
  }
}

// MARK: - UDAExplainerDataSourceProtocol
extension UDAExplainerDefaultDataSource: UDAExplainerDataSourceProtocol {

  public func uda_explainerConfiguration(for type: UDAExplainerType, inCompactDevice: Bool) -> UDAExplainerConfiguration {
    return UDAExplainerDefaultDataSource.configuration(for: type, inCompactDevice: inCompactDevice)
  }
}
