#
# Be sure to run `pod lib lint DSSlideDownView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "DSSlideDownView"
  s.version          = "0.1.1"
  s.summary          = "A UIView subclass with a bouncing effect and an overlay"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = "This is UIComponent and a subclass of UIView. It contains a custom animation in and out with an added overlay underneath the presented view. The current version has a static height."

  s.homepage         = "https://github.com/danstepanov/DSSlideDownView"
  # s.screenshots     = "http://imgur.com/twWY0O1", "http://imgur.com/qgsEWKj"
  s.license          = 'MIT'
  s.author           = { "Dan Stepanov" => "danhstepanov@gmail.com" }
  s.source           = { :git => "https://github.com/danstepanov/DSSlideDownView.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/danstepanov'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'DSSlideDownView' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
