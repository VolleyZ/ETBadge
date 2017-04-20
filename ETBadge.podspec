Pod::Spec.new do |s|
  s.name         = "ETBadge"
  s.version      = "1.0.1"
  s.summary      = "A tool to add or clear badge for any UIView."
  s.homepage     = "https://github.com/VolleyZ/ETBadge"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "VolleyZ" => "552408690@qq.com" }
  s.source       = { :git => "https://github.com/VolleyZ/ETBadge.git", :tag => "1.0.1"}
  s.source_files  = "Class", "Class/*.{h,m}"
  s.dependency  'SnapKit', '~> 3.2.0'
  s.platform            = :ios, '8.0'
end
