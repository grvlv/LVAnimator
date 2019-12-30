Pod::Spec.new do |spec|
  spec.name         = "LVAnimator"
  spec.version      = "1.0.0"
  spec.summary      = "A clean and lightweight LVAnimator for your iOS and tvOS app."
  #spec.description  = "Description"
  spec.homepage     = "https://github.com/grvlv/LVAnimator"
  spec.license      = "MIT"
  spec.author       = { "grvlv" => "grv_lv@126.com" }
  spec.source       = { :git => "https://github.com/grvlv/LVAnimator.git", :tag => "#{spec.version}" }
  spec.source_files  = "LVAnimator/LVAnimator/*"
  spec.requires_arc = true
  spec.ios.deployment_target = '8.0'
end
