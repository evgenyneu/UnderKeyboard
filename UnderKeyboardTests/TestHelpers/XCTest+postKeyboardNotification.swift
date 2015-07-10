import UIKit
import XCTest

extension XCTest {
  func postKeyboardWillShowNotification(keyboardSize: CGSize) {
    let userInfo = keyboardNotificationUserInfo(keyboardSize)

    NSNotificationCenter.defaultCenter().postNotificationName(UIKeyboardWillShowNotification,
      object: self, userInfo: userInfo)
  }
  
  func postKeyboardWillHideNotification() {
    let userInfo = keyboardNotificationUserInfo(CGSize())
    
    NSNotificationCenter.defaultCenter().postNotificationName(UIKeyboardWillHideNotification,
      object: self, userInfo: userInfo)
  }
  
  private func keyboardNotificationUserInfo(keyboardSize: CGSize) -> [NSObject: AnyObject]{
    let rect = CGRect(origin: CGPoint(), size: CGSize(width: 49, height: 51))
    let rectValue = NSValue(CGRect: rect)
    
    return [
      UIKeyboardFrameEndUserInfoKey: rectValue,
      UIKeyboardAnimationDurationUserInfoKey: NSNumber(double: 0),
      UIKeyboardAnimationCurveUserInfoKey: NSNumber(int: 0)
    ]
  }
}