Pod::Spec.new do |spec|
  spec.name         = "UDAExplainer"
  spec.version      = "1.3.0"
  spec.summary      = "Sensitive user data access explainer."
  spec.description  = <<-DESC
  Sensitive user data access explainer, such as for Photo Library, Face ID, App Tracking Transparency, etc.
                   DESC
  spec.license      = "MIT"
  spec.source       = { :git => "https://github.com/Kjuly/UDAExplainer.git", :tag => "#{spec.version}" }
  spec.homepage     = "https://github.com/Kjuly/UDAExplainer"
  spec.screenshots  = "https://raw.githubusercontent.com/Kjuly/preview/main/UDAExplainer/01.png", "https://raw.githubusercontent.com/Kjuly/preview/main/UDAExplainer/02.png", "https://raw.githubusercontent.com/Kjuly/preview/main/UDAExplainer/iPad_01.png"

  spec.author             = { "Kjuly" => "dev@kjuly.com" }
  spec.social_media_url   = "https://twitter.com/kJulYu"

  spec.ios.deployment_target = "15.5"

  spec.swift_version = '5.0'

  spec.source_files  = "UDAExplainer"
  spec.exclude_files = "UDAExplainer/UDAExplainer.docc"

  spec.requires_arc = true
end
