Pod::Spec.new do |spec|

  spec.name         = "Mobtune_IOS"
  spec.version      = "0.9.18"
  spec.summary      = "MOBTUNE 사용을 위한 XCFramework입니다."

  spec.description  = <<-DESC
			MOBTUNE 사용을 위한 XCFramework입니다.
			MOBTUNE 사용을 위해서는 APP_KEY를 발급 받으셔야 합니다.
                   DESC

  spec.homepage     = "https://github.com/mobon/MobtuneSDK_IOS"

  spec.author             = { "Enliple" => "dhkim4@enliple.com" }

  spec.platform     = :ios, "11.0"

  spec.source       = { :git => "https://github.com/mobon/MobtuneSDK_IOS.git",
                        :tag => "0.9.18"
                      }
 
  spec.license	   = { :type => "COMMERCIAL", :text => "Copyright (c) ENLIPLE" }
 
  spec.vendored_frameworks = "Mobtune.xcframework"

end
