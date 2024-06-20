//
//  ContentView.swift
//  UDAExplainerDemo
//
//  Created by Kjuly on 14/6/2023.
//  Copyright © 2023 Kaijie Yu. All rights reserved.
//

import SwiftUI
import UDAExplainer

struct ContentView: View {

  @State private var isPreviewMode: Bool = true
  @State private var selectedTypeForExplainer: UDAExplainerType?

  @State private var selectedTypeName: String = "None Selected"
  @State private var selectedTypeStatusText: String = ""

  private let isCompactDevice: Bool = UIDevice.current.userInterfaceIdiom == .phone

  var body: some View {
    NavigationView {
      _listView()
        .navigationTitle(Text("UDAExplainer Demo"))
        .safeAreaInset(edge: .bottom, content: _statusView)
    }
    .navigationViewStyle(.stack)
    .onReceive(NotificationCenter.default.publisher(for: .UDAExplainer.shouldContinue)) { note in
      guard let type = note.object as? UDAExplainerType else {
        return
      }
      if self.isPreviewMode { // Just dismiss the explainer view for the preview mode.
        NotificationCenter.default.post(name: .UDAExplainer.shouldDismissView, object: type)
      } else {
        DemoPrivacyAuthorizer.requestAuthorisation(for: type)
      }
    }
  }

  // MARK: - Event

  private func _didSelectType(_ type: UDAExplainerType) {
    if self.isPreviewMode {
      self.selectedTypeForExplainer = type

    } else {
      self.selectedTypeName = type.key

      if let statusText = DemoPrivacyAuthorizer.authorizationStatusText(for: type) {
        self.selectedTypeStatusText = statusText
      } else {
        self.selectedTypeForExplainer = type
      }
    }
  }

  // MARK: - Subviews

  private func _listView() -> some View {
    List(UDAExplainerType.allCases) { type in
      Button(type.key) {
        _didSelectType(type)
      }
    }
    .listStyle(.plain)
    .fullScreenCover(item: $selectedTypeForExplainer) { type in
      let config = UDAExplainerDefaultDataSource.configuration(for: type, inCompactDevice: self.isCompactDevice)
      UDAExplainerView(config: config)
    }
  }

  private func _statusView() -> some View {
    VStack(alignment: .center, spacing: 10) {
      Divider().padding(.bottom, 10)

      Group {
        if self.isPreviewMode {
          Text("Will skip the authorization step.")
            .font(.footnote)
            .foregroundColor(.secondary)
            .multilineTextAlignment(.center)
            .padding(.bottom, 5)
        } else {
          _selectedTypeStatusView()
        }

        Toggle("Preview Mode", isOn: $isPreviewMode)
          .frame(height: 44)
          .padding(.horizontal, 15)
          .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
              .fill(Color(uiColor: .tertiarySystemBackground))
          )
      }
      .padding(.horizontal, 15)
    }
    .background(Color(uiColor: .secondarySystemBackground))
  }

  @ViewBuilder
  private func _selectedTypeStatusView() -> some View {
    let description = """
System authorization alerts are only displayed once when a specific type of status has not yet been determined.

If you want to see the same authorization alerts, you will need to reinstall the demo.
"""
    Text(description)
      .font(.footnote)
      .foregroundColor(.secondary)
      .multilineTextAlignment(.center)
      .padding(.bottom, 5)

    HStack {
      Text(self.selectedTypeName)
      Spacer()
      Text(self.selectedTypeStatusText)
        .foregroundColor(.secondary)
    }
    .frame(height: 44)
    .padding(.horizontal, 15)
    .background(
      RoundedRectangle(cornerRadius: 10, style: .continuous)
        .fill(Color(uiColor: .tertiarySystemBackground))
    )
  }
}

// MARK: - ContentView Previews

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
