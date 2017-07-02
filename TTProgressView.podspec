Pod::Spec.new do |s|
  s.name         = "TTProgressView"
  s.version      = "1.0.2"
  s.summary      = "TTProgressView."
  s.description  = "a ProgressView created by TT"
  s.homepage     = "https://github.com/TuteTipito/TTProgressView.git"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  s.license      = "MIT"
  s.author       = { "" => "" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/TuteTipito/TTProgressView.git", :tag => "#{s.version}" }
  s.source_files  = "TTProgressView/TTProgressVIew/**/*.{h,m,swift}"
end
