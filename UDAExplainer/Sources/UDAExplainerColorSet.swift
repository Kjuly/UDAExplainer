//
//  UDAExplainerColorSet.swift
//  UDAExplainer
//
//  Created by Kjuly on 12/6/2023.
//  Copyright © 2023 Kaijie Yu. All rights reserved.
//

import UIKit
import SwiftUI

public struct UDAExplainerColorSet {

  public let background: Color

  let defaultContent: Color
  let secondaryContent: Color

  let accent: Color
  let textOverAccent: Color

  let separator: Color
  let green: Color

  // MARK: - Init

  public init(
    background: Color,
    defaultContent: Color,
    secondaryContent: Color,
    accent: Color,
    textOverAccent: Color,
    separator: Color,
    green: Color
  ) {
    self.background = background

    self.defaultContent = defaultContent
    self.secondaryContent = secondaryContent

    self.accent = accent
    self.textOverAccent = textOverAccent

    self.separator = separator
    self.green = green
  }

  public init(
    backgroundUIColor: UIColor,
    defaultContentUIColor: UIColor,
    secondaryContentUIColor: UIColor,
    accentUIColor: UIColor,
    textOverAccentUIColor: UIColor,
    separatorUIColor: UIColor,
    greenUIColor: UIColor
  ) {
    self.init(
      background: .init(uiColor: backgroundUIColor),
      defaultContent: .init(uiColor: defaultContentUIColor),
      secondaryContent: .init(uiColor: secondaryContentUIColor),
      accent: .init(uiColor: accentUIColor),
      textOverAccent: .init(uiColor: textOverAccentUIColor),
      separator: .init(uiColor: separatorUIColor),
      green: .init(uiColor: greenUIColor))
  }

  init() {
    self.init(
      backgroundUIColor: .systemGroupedBackground,
      defaultContentUIColor: .label,
      secondaryContentUIColor: .secondaryLabel,
      accentUIColor: .label,
      textOverAccentUIColor: .systemBackground,
      separatorUIColor: .opaqueSeparator,
      greenUIColor: .systemGreen)
  }
}
