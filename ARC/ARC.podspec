
Pod::Spec.new do |spec|

  spec.name         = "ARC"
  spec.version      = "0.0.3"
  spec.summary      = "ARC Help to reduce your code. and provide you lot's of userful function pre installed"
  spec.description  = "ARC is really helpfull library. user don't have to right code again and again. ARC provide lot's of basic function related (Alert (POP UP).
Animation.
API call (GET & POST method).
Data-Time function.
Loader.
Location.
TextField.
String).
also we try to implement more helpful function in framework."

  spec.homepage     = "https://github.com/saiasta/ARC"
  spec.license      = "MIT"
  spec.author       = { "pawan" => "pawan.5340124@gmail.com" }
  spec.platform     = :ios, "10.0"
  spec.swift_version  = '4.0'
  spec.source       = { :git => "https://github.com/saiasta/ARC.git", :tag => "0.0.3" }
  spec.source_files = 'ARC/ARC/*.{h,m,swift}'
  spec.exclude_files = "ARC/ARC/*.plist"
  spec.ios.framework  = 'UIKit'
  spec.dependency 'Alamofire'
  spec.dependency 'SQLite.swift'

end
