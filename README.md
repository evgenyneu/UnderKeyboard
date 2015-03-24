## Move scroll view content from under the keyboard on iOS/Swift

This is a helper function that makes sure scroll view is not obscured by virtual keyboard.

## Setup

Copy `UnderKeyboard.swift` into your project.

## Usage

Call this method before keyboard is shown. It can be done in `viewDidLoad`.


```Swift
UnderKeyboard.scrollView(scrollView)
```

Now when the virtual keyboard is shown it adjusts the bottom inset of the scroll view by
the height of the keyboard.

## Reference

[Managing Keyboard](https://developer.apple.com/library/ios/documentation/StringsTextFonts/Conceptual/TextAndWebiPhoneOS/KeyboardManagement/KeyboardManagement.html)

## Credits

Cute wombat photo is made by [checha](http://www.freeimages.com/profile/checha) and downloaded from here:

http://www.freeimages.com/browse.phtml?f=download&id=203754