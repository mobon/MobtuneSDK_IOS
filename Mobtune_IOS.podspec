Pod::Spec.new do |spec|

  spec.name         = "Mobtune_IOS"
  spec.version      = "0.9.0"
  spec.summary      = "MOBTUNE 사용을 위한 XCFramework입니다."

  spec.description  = <<-DESC
			MOBTUNE 사용을 위한 XCFramework입니다.
                   DESC

  spec.homepage     = "https://github.com/mobon/MobtuneSDK_IOS"

  spec.author             = { "Enliple" => "dhkim4@enliple.com" }

  spec.platform     = :ios, "13.0"

  spec.source       = { :http => "https://github.com/mobon/MobtuneSDK_IOS/tree/main/Mobtune.xcframework"}
 
  spec.license	   = { :type => "COMMERCIAL", :text => "Copyright (c) ENLIPLE" }
 
  spec.preserve_paths = "Mobtune.xcframework"
  spec.vendored_frameworks = "Mobtune.xcframework"


end
