Pod::Spec.new do |s|
  s.name         = "TTProgressView"
  s.version      = "1.0.3"
  s.summary      = "TTProgressView."
  s.description  = "a ProgressView created by TT"
  s.homepage     = "https://github.com/TuteTipito/TTProgressView.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Matias Spinelli" => "matias.spinelli@gmail.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/TuteTipito/TTProgressView.git", :tag => "#{s.version}" }
  s.source_files  = "TTProgressVIew/**/*.{h,m,swift}"
end
