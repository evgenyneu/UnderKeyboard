# An iOS / Swift libary for moving content from under the keyboard

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)][carthage]
[![CocoaPods Version](https://img.shields.io/cocoapods/v/UnderKeyboard.svg?style=flat)][cocoadocs]
[![License](https://img.shields.io/cocoapods/l/UnderKeyboard.svg?style=flat)][cocoadocs]
[![Platform](https://img.shields.io/cocoapods/p/UnderKeyboard.svg?style=flat)][cocoadocs]
[cocoadocs]: http://cocoadocs.org/docsets/UnderKeyboard
[carthage]: https://github.com/Carthage/Carthage

This library helps moving your views when a keyboard appears and move them back in place when it hides.
It includes helper classes for animating a bottom Auto Layout constraint and the bottom inset of a scroll view.


## Setup

There are three ways you can add UnderKeyboard to your project.

**Add source (iOS 7+)**

Simply add [UnderKeyboardDistrib.swift](https://github.com/exchangegroup/UnderKeyboard/blob/master/Distrib/UnderKeyboardDistrib.swift) into your project.

**Setup with Carthage (iOS 8+)**

Alternatively, add `github "exchangegroup/UnderKeyboard" ~> 2.0` to your Cartfile and run `carthage update`.

**Setup with CocoaPods (iOS 8+)**

If you are using CocoaPods add this text to your Podfile and run `pod install`.

    use_frameworks!
    pod 'UnderKeyboard', '~> 2.0'


## Usage


### Move content up

When a keyboard appears on screen it can obscure your views. One way of preventing it is to create a bottom Auto Layout constraint and increase its length when a keyboard appears. You can use the `UnderKeyboardLayoutConstraint` helper class that does exactly that. Note that bottom layout constraint can be both a simple `equal` relation consraint or it can be `greater than`, as shown in the demo.

```Swift
@IBOutlet weak var bottomLayoutConstraint: NSLayoutConstraint!
var underKeyboardLayoutConstraint = UnderKeyboardLayoutConstraint()

override func viewDidLoad() {
  super.viewDidLoad()
  underKeyboardLayoutConstraint.setup(bottomLayoutConstraint, view: view,
    bottomLayoutGuide: bottomLayoutGuide)
}
```

<img src='https://raw.githubusercontent.com/exchangegroup/UnderKeyboard/master/Graphics/bottom_constraint.png' alt='Increase height of bottom layout constraint when keyboard appears in iOS' width='601'>


### Adjusting scroll view bottom insets

Suppose we have a text view that stretches all the way down to the bottom of the screen. If virtual keyboard appears it is shown over the scroll view content. The problem is there is no way for users to see the bottom of the scroll view content because is it obscured by the keyboard.

To fix this problem you can use the `UnderKeyboardScrollView` class

```Swift
@IBOutlet weak var textView: UITextView!
var underKeyboardScrollView = UnderKeyboardScrollView()

override func viewDidLoad() {
  super.viewDidLoad()
  underKeyboardScrollView.setup(textView, bottomLayoutGuide: bottomLayoutGuide)
}
```


When virtual keyboard is shown we adjust the bottom inset of the scroll view by the height of the keyboard.

<img src="https://raw.githubusercontent.com/exchangegroup/UnderKeyboard/master/Graphics/under_the_keyboard_ios.png" alt="Move scroll view content from under the keyboard in iOS/Swift" width="640" />


### Using keyboard observer directly

This library includes a `UnderKeyboardObserver` that you can use to write your own custom logic. You can supply functions that will be called by this observer when the keyboard is shown and hidden. The function will be called with the height of the keyboard passed an an argument.

```Swift
var keyboardObserver = UnderKeyboardObserver()

override func viewDidLoad() {
  super.viewDidLoad()

  keyboardObserver.start()

  // Called before the keyboard is animated
  keyboardObserver.willAnimateKeyboard = { isShowing, height in
    myConstraint.constant = height
  }

  // Called inside the UIView.animateWithDuration block
  keyboardObserver.animateKeyboard = { isShowing, height in
    myView.layoutIfNeeded()
  }
}
```


## Reference

[Managing Keyboard](https://developer.apple.com/library/ios/documentation/StringsTextFonts/Conceptual/TextAndWebiPhoneOS/KeyboardManagement/KeyboardManagement.html)

## License

UnderKeyboard is released under the [MIT License](LICENSE).
