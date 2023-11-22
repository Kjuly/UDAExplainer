# UDAExplainer

Sensitive user data access explainer, such as for Photos Library, Face ID, App Tracking Transparency, etc.

![iOS](https://img.shields.io/badge/iOS-15.5%2B-blue?style=flat)
![SwiftPM](https://img.shields.io/badge/SwiftPM-ready-green)

<div align="center">
<img src="https://raw.githubusercontent.com/Kjuly/preview/main/UDAExplainer/01.png" alt="iPhone Preview - Light" height="360" /> 
<img src="https://raw.githubusercontent.com/Kjuly/preview/main/UDAExplainer/02.png" alt="iPhone Preview - Dark" height="360" />
<img src="https://raw.githubusercontent.com/Kjuly/preview/main/UDAExplainer/iPad_01.png" alt="iPad Preview" height="360" />
</div>

## Usage with Swift UI

```Swift
@State private var explainerType: UDAExplainerType?
private let isCompactDevice: Bool = UIDevice.current.userInterfaceIdiom == .phone

var body: some View {
  ... {
    // Assign self.explainerType when the authorisation status is not determined.
  }
  .fullScreenCover(item: $explainerType) { type in
    let config = UDAExplainerDefaultDataSource.configuration(for: type, inCompactDevice: self.isCompactDevice)
    UDAExplainerView(config: config)
  }
  .onReceive(NotificationCenter.default.publisher(for: .UDAExplainer.shouldContinue)) { note in
    if let type = note.object as? UDAExplainerType {
      // ... Do authorisation for this type, and post notification to dismiss the explainer view
      //   when the authorisation is done.
      NotificationCenter.default.post(name: .UDAExplainer.shouldDismissView, object: type)
    }
  }
}
```

## Usage with UIKit

```Swift
func presentUDAExplainer(for type: UDAExplainerType) {
  let config = UDAExplainerDefaultDataSource.configuration(for: type, inCompactDevice: self.isCompactDevice)
  let explainerViewController = UDAExplainerHostingController(with: config)
  viewController.present(explainerViewController, animated: false)

  NotificationCenter.default.addObserver(
    self,
    selector: #selector(_handleUDAExplainerShouldContinueNotification),
    name: .UDAExplainer.shouldContinue,
    object: nil)
}

@objc private func _handleUDAExplainerShouldContinueNotification(_ note: NSNotification) {
  guard let type = note.object as? UDAExplainerType else {
    return
  }
  NotificationCenter.default.removeObserver(self, name: .UDAExplainer.shouldContinue, object: nil)

  // ... Do authorisation for this type, and post notification to dismiss the explainer view
  //   when the authorisation is done.
  NotificationCenter.default.post(name: .UDAExplainer.shouldDismissView, object: type)
}
```

## Customization

You can feed UDAExplainer with a custom `UDAExplainerConfiguration` instance, which provides expected contents and color set.

Please refer to `UDAExplainerDefaultDataSource` for details.

