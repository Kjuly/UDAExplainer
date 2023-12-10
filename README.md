# UDAExplainer

Sensitive user data access explainer, such as for Photos Library, Face ID, App Tracking Transparency, etc.

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FKjuly%2FUDAExplainer%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/Kjuly/UDAExplainer)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FKjuly%2FUDAExplainer%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/Kjuly/UDAExplainer)  
![iOS][iOS-Badge]  
[![SPM][SPM-Badge]][SPM-Link] [![CocoaPods][CocoaPods-Badge]][CocoaPods-Link] [![Carthage][Carthage-Badge]][Carthage-Link]

[iOS-Badge]: https://img.shields.io/badge/iOS-15.5%2B-blue?labelColor=00367A&color=3081D0

[SPM-Badge]: https://img.shields.io/github/v/tag/Kjuly/UDAExplainer?label=SPM&labelColor=2F4858&color=A8DF8E
[SPM-Link]: https://swiftpackageindex.com/Kjuly/UDAExplainer
[CocoaPods-Badge]: https://img.shields.io/cocoapods/v/UDAExplainer?label=CocoaPods&labelColor=2F4858&color=A8DF8E
[CocoaPods-Link]: https://cocoapods.org/pods/UDAExplainer
[Carthage-Badge]: https://img.shields.io/github/v/tag/Kjuly/UDAExplainer?label=Carthage&labelColor=2F4858&color=A8DF8E
[Carthage-Link]: https://swiftpackageindex.com/Kjuly/UDAExplainer


<div align="center">
<img src="https://raw.githubusercontent.com/Kjuly/preview/main/UDAExplainer/01.png" alt="iPhone Preview - Light" height="360" /> 
<img src="https://raw.githubusercontent.com/Kjuly/preview/main/UDAExplainer/02.png" alt="iPhone Preview - Dark" height="360" />
<img src="https://raw.githubusercontent.com/Kjuly/preview/main/UDAExplainer/iPad_01.png" alt="iPad Preview" height="360" />
</div>

## Installation

See the following subsections for details on the different installation methods.

- [Swift Package Manager](INSTALLATION.md#swift-package-manager)
- [CocoaPods](INSTALLATION.md#cocoaPods)
- [Carthage](INSTALLATION.md#carthage)
- [Submodule](INSTALLATION.md#submodule)

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

