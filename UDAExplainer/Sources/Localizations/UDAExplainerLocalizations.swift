//
//  UDAExplainerLocalizations.swift
//  UDAExplainer
//
//  Created by Kaijie Yu on 26/4/2023.
//  Copyright © 2023 Kaijie Yu. All rights reserved.
//

import Foundation

extension String {
  var uda_explainerLocalized: String {
#if KY_USER_DATA_ACCESS_EXPLAINER_FRAMEWORK
    return NSLocalizedString(self,
                             tableName: "UDAExplainerLocalizations",
                             bundle: Bundle(identifier: "com.kjuly.UDAExplainer") ?? Bundle.main,
                             value: "",
                             comment: "")
#else
    return NSLocalizedString(self, tableName: "UDAExplainerLocalizations", bundle: .module, value: "", comment: "")
#endif
  }
}
