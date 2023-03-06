Pod::Spec.new do |spec|
  spec.name         = "CustomComponents"
  spec.version      = "1.0.2"
  spec.summary      = "This is the best CustomComponents Framework."
  spec.description  = "This is the best framework ever. It will help you to get all the common files to your project"

  spec.homepage     = "https://github.com/akshayparth/CustomComponents"

  spec.license      = "MIT"
  spec.author       = { "Akshay Raiyani" => "akshay.raiyani@parth.com" }
  spec.platform     = :ios, "12.0"
  spec.source       = { :git => "https://github.com/akshayparth/CustomComponents.git", :tag => spec.version.to_s }
  spec.source_files  = "CustomComponents/**/*.{swift,storyboard}"
  
  #spec.exclude_files = "Classes/Exclude"
  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"


  spec.frameworks  = "UIKit", "AVFoundation", "Foundation", "CoreLocation"
  spec.swift_versions = "5.0"
  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"
  # spec.requires_arc = true

end
