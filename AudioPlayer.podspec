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
