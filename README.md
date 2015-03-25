## Move scroll view content from under the keyboard on iOS/Swift

This is a helper function and a demo app that moves scroll view content from under the keyboard on iOS.

## What's the problem?

Suppose we have a scroll view or a text view, or a table view on iOS screen. That scroll view stretches all the way down to the bottom of the screen. If virtual keyboard appears it is shown over the scroll view content. The problem is there is no way for users to see the bottom of the scroll view content because is it obscured by the keyboard.

## Solution

When virtual keyboard is shown we can adjust the bottom inset of the scroll view by the height of the keyboard.

<img src="https://raw.githubusercontent.com/exchangegroup/under-keyboard-ios/master/Graphics/under_the_keyboard_ios.png" alt="Move scroll view content from under the keyboard in iOS/Swift" width="640" />

## Setup

Copy [UnderKeyboard.swift](https://raw.githubusercontent.com/exchangegroup/under-keyboard-ios/master/UnderKeyboardDemo/UnderKeyboard.swift) into your project.

## Usage

Call `UnderKeyboard.scrollView` function before keyboard is shown. It can be done in `viewDidLoad`.


```Swift
UnderKeyboard.scrollView(scrollView)
```

One can also use `UITextView` and `UITableView` objects or other subclasses of `UIScrollView`.

## Reference

[Managing Keyboard](https://developer.apple.com/library/ios/documentation/StringsTextFonts/Conceptual/TextAndWebiPhoneOS/KeyboardManagement/KeyboardManagement.html)

## Project home

https://github.com/exchangegroup/under-keyboard-ios
