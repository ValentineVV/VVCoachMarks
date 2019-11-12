Pod::Spec.new do |spec|

  spec.platform = :ios
  spec.ios.deployment_target = "10.0"
  spec.name = "VVCoachMarks"
  spec.version = "0.0.1"
  spec.summary = "VVCoachMarks lets users show coach marks in an easy way."
  
  spec.license = { :type => "MIT", :file => "LICENSE" }
  
  spec.author = { "Valentine Vasilevickiy" => "valentinvasilevickiyv@gmail.com" }
  spec.homepage = "https://github.com/ValentineVV/VVCoachMarks"
  spec.source = { :git => "https://github.com/ValentineVV/VVCoachMarks.git", :tag => "#{spec.version}" }
  
  spec.source_files  = "CoachMarks/**/*.{swift}"
  spec.swift_version = "5.0"

end
