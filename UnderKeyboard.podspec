
Pod::Spec.new do |s|
  s.name        = "UnderKeyboard"
  s.version     = "1.0.5"
  s.license     = { :type => "MIT" }
  s.homepage    = "https://github.com/exchangegroup/UnderKeyboard"
  s.summary     = "A helper function for moving scroll view content from under the keyboard written in Swift"
  s.description  = <<-DESC
                   Moves scroll view content from under the keyboard on iOS. It adjusts the bottom inset of the scroll view by the height of the keyboard when it is shown.
                   DESC
  s.authors     = { "Evgenii Neumerzhitckii" => "sausageskin@gmail.com" }
  s.source      = { :git => "https://github.com/exchangegroup/UnderKeyboard.git", :tag => s.version }
  s.source_files = "UnderKeyboard/*.swift"
  s.ios.deployment_target = "8.0"
end