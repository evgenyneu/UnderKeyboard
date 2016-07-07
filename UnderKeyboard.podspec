
Pod::Spec.new do |s|
  s.name        = "UnderKeyboard"
  s.version     = "6.0.0"
  s.license     = { :type => "MIT" }
  s.homepage    = "https://github.com/marketplacer/UnderKeyboard"
  s.summary     = "An iOS / Swift libary for moving content from under the keyboard"
  s.description  = <<-DESC
                   This library helps moving your views when a keyboard appears and move them back in place when it hides. It includes helper class for animating a bottom Auto Layout constraint.
                   DESC
  s.authors     = { "Evgenii Neumerzhitckii" => "sausageskin@gmail.com" }
  s.source      = { :git => "https://github.com/marketplacer/UnderKeyboard.git", :tag => s.version }
  s.source_files = "UnderKeyboard/*.swift"
  s.ios.deployment_target = "8.0"
end