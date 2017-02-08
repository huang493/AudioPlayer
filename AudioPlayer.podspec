#
#  Be sure to run `pod spec lint AudioPlayer.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "AudioPlayer"
  s.version      = "0.0.1"
  s.summary      = "A short description of AudioPlayer."
  s.description  = "AudioPlayer"
  s.license      = "MIT"
  s.author       = { "hsm" => "727593012@qq.com" }
  s.platform     = :ios
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/huang493/AudioPlayer.git" }
  s.source_files  = "AudioTest/HysteriaPlayer/**/*.{h,m}"
  s.resources = "Resources/*.{png,mp3}"
  s.requires_arc = true
  s.dependency "HysteriaPlayer"
  s.dependency "ReactiveCocoa"
  s.dependency "AFNetworking"

end
