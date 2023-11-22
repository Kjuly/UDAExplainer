//
//  UDAExplainerConfiguration.swift
//  UDAExplainer
//
//  Created by Kjuly on 11/6/2023.
//  Copyright © 2023 Kaijie Yu. All rights reserved.
//

import Foundation

// MARK: - Configuration

public struct UDAExplainerConfiguration {

  let type: UDAExplainerType

  let title: String
  let detailItems: [UDAExplainerDetailItem]

  let declareIconName: String?
  let declareText: String

  let continueButtonTitle: String
  let footnote: String

  /// Whether it's for compact device (e.g., iPhone).
  let isCompactDevice: Bool
  /// Color set.
  public let colorSet: UDAExplainerColorSet

  // MARK: - Init

  public init(
    type: UDAExplainerType,
    title: String?,
    detailItems: [UDAExplainerDetailItem],
    declareIconName: String?,
    declareText: String?,
    continueButtonTitle: String?,
    footnote: String?,
    isCompactDevice: Bool,
    colorSet: UDAExplainerColorSet?
  ) {
    self.type = type

    // Title
    self.title = title ?? String(format: "Shared:Title (Usage: %@)".uda_explainerLocalized, type.defaultLocalizedUsageName)
    // Detail Items
    self.detailItems = detailItems

    // Declare
    self.declareIconName = declareIconName ?? "checkmark.shield.fill"
    self.declareText = declareText ?? type.defaultLocalizedDeclare

    // Continue
    self.continueButtonTitle = continueButtonTitle ?? "Continue".uda_explainerLocalized
    // Footnote
    self.footnote = footnote ?? String(format: "Shared:Footnote (SettingsOption: %@)".uda_explainerLocalized, type.localizedSettingsOptionName)
    // UI
    self.isCompactDevice = isCompactDevice
    self.colorSet = colorSet ?? .init()
  }

  public init(
    type: UDAExplainerType,
    detailItems: [UDAExplainerDetailItem],
    isCompactDevice: Bool,
    colorSet: UDAExplainerColorSet?
  ) {
    self.init(
      type: type,
      title: nil,
      detailItems: detailItems,
      declareIconName: nil,
      declareText: nil,
      continueButtonTitle: nil,
      footnote: nil,
      isCompactDevice: isCompactDevice,
      colorSet: colorSet)
  }
}

// MARK: - Detail Item

public struct UDAExplainerDetailItem: Identifiable {
  public var id: String { iconName + title }

  let iconName: String
  let title: String
  let subtitle: String?

  public init(iconName: String, title: String, subtitle: String?) {
    self.iconName = iconName
    self.title = title
    self.subtitle = subtitle
  }
}

#if DEBUG
extension UDAExplainerDetailItem: Equatable {

  public static func == (lhs: UDAExplainerDetailItem, rhs: UDAExplainerDetailItem) -> Bool {
    return (
      lhs.id == rhs.id &&
      lhs.iconName == rhs.iconName &&
      lhs.title == rhs.title &&
      lhs.subtitle == rhs.subtitle
    )
  }
}
#endif
