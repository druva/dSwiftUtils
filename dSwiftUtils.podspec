#
# Be sure to run `pod lib lint dSwiftUtils.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "dSwiftUtils"
  s.version          = "0.0.9"
  s.summary          = "A very short description of dSwiftUtils."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "A goes very very short description of dSwiftUtils."

  s.homepage         = "https://github.com/druva/dSwiftUtils"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Druva" => "druva.yarlagadda@valuelabs.com" }
  s.source           = { :git => "https://github.com/druva/dSwiftUtils.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/druva'

  s.ios.deployment_target = '8.0'

  s.source_files = 'dSwiftUtils/Classes/**/*'
  s.resource_bundles = {
    'dSwiftUtils' => ['dSwiftUtils/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit'
  # s.dependency ''
end
