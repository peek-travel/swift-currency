Pod::Spec.new do |spec|
  spec.name         = "SwiftCurrency"
  spec.version      = "0.6.1"
  spec.summary      = "Swift Currency provides type-safe representations of ISO 4217 currencies in Swift."
  spec.description  = <<-DESC
Swift Currency provides type-safe representations of ISO 4217 currencies in Swift.

It provides many conveniences for working with currencies, such as literal representations, string interpolation, and mathematics.
                   DESC

  spec.homepage          = "https://github.com/peek-travel/swift-currency"
  spec.documentation_url = "https://peek-travel.github.io/swift-currency/"
  spec.license           = { :type => "MIT", :file => "LICENSE.txt" }

  spec.author         = "Peek Travel"
  spec.source         = { :git => "https://github.com/peek-travel/swift-currency.git", :tag => "#{spec.version}" }
  spec.source_files   = "Sources/**/*.swift"
  spec.exclude_files  = "Tests", "scripts"
  spec.swift_versions = '5.0'

  spec.ios.deployment_target     = '10.0'
  spec.osx.deployment_target     = '10.11'
  spec.watchos.deployment_target = '3.0'
  spec.tvos.deployment_target    = '9.0'
end
