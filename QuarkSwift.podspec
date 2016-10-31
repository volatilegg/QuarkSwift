#
#  Be sure to run `pod spec lint QuarkSwift.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "QuarkSwift"
  s.version      = "0.0.1"
  s.summary      = "Easy and light-weight extensions for swift 3 iOs project"

  s.homepage     = "https://github.com/volatilegg/QuarkSwift"
  s.license      = { :type => "MIT", :file => "LICENSE.md" }

  s.author             = { "Duc Do" => "duc.fet01@gmail.com" }

  s.platform     = :ios, "9.3"
  s.source       = { :git => "https://github.com/volatilegg/QuarkSwift.git", :tag => "#{s.version}" }
  s.source_files  = "QuarkSwift", "QuarkSwift/**/*.{h,m,swift}"
  s.exclude_files = "QuarkSwift/Exclude"

  s.public_header_files = "QuarkSwift/**/*.h"
end
