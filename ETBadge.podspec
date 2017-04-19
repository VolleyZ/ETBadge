Pod::Spec.new do |s|
  s.name         = "ETBadge"
  s.version      = “1.0.0”
  s.summary      = "A tool to add or clear badge for any UIView."
  s.homepage     = "https://github.com/VolleyZ/ETPopupView"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "VolleyZ" => "552408690@qq.com" }
  s.source       = { :git => "https://github.com/VolleyZ/ETBadge.git", :tag => s.version.to_s}
  s.source_files  = "Classes", "Classes/*.{h,m}"
  s.dependency  'SnapKit', '~> 3.2.0'
  s.platform            = :ios, '8.0'
end
