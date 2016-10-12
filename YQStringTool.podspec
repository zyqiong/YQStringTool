Pod::Spec.new do |s|

  s.name         = "YQStringTool"
  s.version      = "0.0.1"
  s.summary      = "关于字符串的工具类."

  s.homepage     = "https://github.com/zyqiong/YQStringTool"

  s.license      = "MIT"

  s.author             = { "zyqiong" => "yaqiong1021@163.com" }
  s.platform     = :ios
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/zyqiong/YQStringTool.git",:branch => "master", :tag => "0.0.1" }
  s.source_files  = "YQStringTool/YQStringTool/YQTool/*.{h,m}"
  s.public_header_files = "YQStringTool/YQStringTool/YQTool/*.h"

  s.framework  = "UIKit","Foundition"

end
