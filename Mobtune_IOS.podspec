Pod::Spec.new do |spec|

  spec.name         = "Mobtune_IOS"
  spec.version      = "0.9.0"
  spec.summary      = "A short description of Mobtune_IOS."

  spec.description  = <<-DESC
                   DESC

  spec.homepage     = "https://github.com/mobon/MobtuneSDK_IOS"

  spec.author             = { "Enliple" => "dhkim4@enliple.com" }

  # spec.platform     = :ios
  # spec.platform     = :ios, "5.0"

  spec.source       = { :http => "http://EXAMPLE/Mobtune_IOS.git"}
 
  spec.license	   = { :type => "COMMERCIAL", :text => Copyright (c)
 
  spec.preserve_paths = "Mobtune.xcframework"
  spce.vendored_frameworks = "Mobtune.xcframework"


end
