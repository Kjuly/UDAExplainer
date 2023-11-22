//
//  View+UDAExplainer.swift
//  UDAExplainer
//
//  Created by Kjuly on 11/6/2023.
//  Copyright © 2023 Kaijie Yu. All rights reserved.
//

import SwiftUI

private struct HideScrollContentBackgroundModifier: ViewModifier {
  func body(content: Content) -> some View {
    if #available(iOS 16.0, *) {
      content.scrollContentBackground(.hidden)
    } else {
      content
    }
  }
}

extension View {
  func uda_hideScrollContentBackground() -> some View {
    modifier(HideScrollContentBackgroundModifier())
  }
}
