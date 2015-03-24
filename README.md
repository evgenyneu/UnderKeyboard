## Move scroll view content from under the keyboard on iOS/Swift

This is a helper function that makes sure scroll view isn't obscured by virtual keyboard.

## Setup

Copy `UnderKeyboard.swift` into your project.

## Usage

Call this method before keyboard is shown. It can be done in `viewDidLoad`.


```Swift
UnderKeyboard.scrollView(scrollView)
```

Now when the virtual keyboard is shown it adjusts the bottom inset of the scroll view by
the height of the keyboard.

One can also use `UITextView` and `UITableView` objects, as they are subclasses of `UIScrollView`.

## Reference

[Managing Keyboard](https://developer.apple.com/library/ios/documentation/StringsTextFonts/Conceptual/TextAndWebiPhoneOS/KeyboardManagement/KeyboardManagement.html)