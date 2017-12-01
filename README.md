# An iOS / Swift libary for moving content from under the keyboard

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods Version](https://img.shields.io/cocoapods/v/UnderKeyboard.svg?style=flat)](http://cocoadocs.org/docsets/UnderKeyboard)
[![License](https://img.shields.io/cocoapods/l/UnderKeyboard.svg?style=flat)](http://cocoadocs.org/docsets/UnderKeyboard)
[![Platform](https://img.shields.io/cocoapods/p/UnderKeyboard.svg?style=flat)](http://cocoadocs.org/docsets/UnderKeyboard)

This library helps moving your views when a keyboard appears and move them back in place when it hides.
It includes helper class for changing the length of a bottom Auto Layout constraint.


<img src='https://raw.githubusercontent.com/evgenyneu/UnderKeyboard/master/Graphics/under_keyboard_demo.gif' alt='Moving content from under the keyboard in iOS / Swift'>

## Setup

There are three ways you can add UnderKeyboard to your project.

#### Add source (iOS 7+)

Simply add [UnderKeyboardDistrib.swift](https://github.com/evgenyneu/UnderKeyboard/blob/master/Distrib/UnderKeyboardDistrib.swift) into your project.

#### Setup with Carthage (iOS 8+)

Alternatively, add `github "evgenyneu/UnderKeyboard" ~> 11.0` to your Cartfile and run `carthage update`.

#### Setup with CocoaPods (iOS 8+)

If you are using CocoaPods add this text to your Podfile and run `pod install`.

    use_frameworks!
    target 'Your target name'
    pod 'UnderKeyboard', '~> 11.0'




#### Legacy Swift versions

Setup a [previous version](https://github.com/evgenyneu/UnderKeyboard/wiki/Legacy-Swift-versions) of the library if you use an older version of Swift.


## Usage

Add `import UnderKeyboard` to your source code if you used Carthage or CocoaPods setup methods.

### Move content up

When a keyboard appears on screen it can obscure your views. One way of preventing it is to create a bottom Auto Layout constraint and increase its length. You can use the `UnderKeyboardLayoutConstraint` helper class that does exactly that. Note that bottom layout constraint relation can be a simple `equal` or it can be `greater than` relation that is used in the login screen of the demo app.

```Swift
@IBOutlet weak var bottomLayoutConstraint: NSLayoutConstraint!
let underKeyboardLayoutConstraint = UnderKeyboardLayoutConstraint()

override func viewDidLoad() {
  super.viewDidLoad()

  underKeyboardLayoutConstraint.setup(bottomLayoutConstraint, view: view)
}
```

<img src='https://raw.githubusercontent.com/evgenyneu/UnderKeyboard/master/Graphics/bottom_constraint.png' alt='Increase height of bottom layout constraint when keyboard appears in iOS' width='601'>

Note: the bottom edge of the `bottomLayoutConstraint` should be connected to the superview and not to layout guide or safe area.



### Using keyboard observer directly

This library includes the `UnderKeyboardObserver` class that you can use to write your own custom logic. You can supply functions that will be called by this observer when the keyboard is shown and hidden. Your function will receive the height of the keyboard. The hight argument is zero if the keyboard is being hidden.

```Swift
let keyboardObserver = UnderKeyboardObserver()

override func viewDidLoad() {
  super.viewDidLoad()
  keyboardObserver.start()

  // Called before the keyboard is animated
  keyboardObserver.willAnimateKeyboard = { height in
    myConstraint.constant = height
  }

  // Called inside the UIView.animateWithDuration animations block
  keyboardObserver.animateKeyboard = { height in
    myView.layoutIfNeeded()
  }
}
```

### Getting height of the keyboard

Use `currentKeyboardHeight` property of the `UnderKeyboardObserver` object to get the current keyboard height.
The `start` method must first be called to start listening for keyboard notifications. The value returned by `currentKeyboardHeight` can be `nil` if keyboard state is unknown. It can happen if no keyboard notifications occurred after the `start` method was called so we don't know if the keyboard is visible or hidden.

```Swift
let keyboardObserver = UnderKeyboardObserver()

override func viewDidLoad() {
  super.viewDidLoad()
  keyboardObserver.start()
}

func myFunction() {
  print("Keyboard height: \(keyboardObserver.currentKeyboardHeight)")
}
```


## API change in version 11

The `bottomLayoutGuide` attribute for `setup` method of the `UnderKeyboardLayoutConstraint` class was removed in version 11. In order to calculate the height of the bottom constaint correctly, its bottom edge should now be connected to the superview and not to layout guide or safe area. The superview should be the one which  the view that matches the size of the app window.


## Reference

[Managing Keyboard](https://developer.apple.com/library/ios/documentation/StringsTextFonts/Conceptual/TextAndWebiPhoneOS/KeyboardManagement/KeyboardManagement.html)

## License

UnderKeyboard is released under the [MIT License](LICENSE).


## 🐘
<img src='https://raw.githubusercontent.com/evgenyneu/UnderKeyboard/master/Graphics/under_keyboard_creature.jpg' width='400' alt='Creature under the keyboard'>
