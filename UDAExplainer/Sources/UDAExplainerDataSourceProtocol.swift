//
//  UDAExplainerDataSourceProtocol.swift
//  UDAExplainer
//
//  Created by Kjuly on 24/6/2023.
//  Copyright © 2023 Kaijie Yu. All rights reserved.
//

import Foundation

/// Custom data source protocol.
///
/// A default data source (`UDAExplainerDefaultDataSource`) has been provided already.
/// You can choose to use it if the default configuration is enough.
///
public protocol UDAExplainerDataSourceProtocol {

  /// Returns a configuration instance for a UDAExplainer type.
  ///
  /// - Parameters:
  ///   - type: The UDAExplainer type (refer to the enum `UDAExplainerType`)
  ///   - inCompactDevice: The explainer view will be presented in a compact device (e.g., iPhone) or not.
  func uda_explainerConfiguration(for type: UDAExplainerType, inCompactDevice: Bool) -> UDAExplainerConfiguration
}
