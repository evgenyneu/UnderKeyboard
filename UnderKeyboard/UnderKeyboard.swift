import UIKit

let tegUnderKeyboard = UnderKeyboard()

@objc
/**

Moves scroll view content from under the keyboard on iOS. It adjusts the bottom inset of the scroll view by the height of the keyboard when it is shown.

*/
public class UnderKeyboard {
  
  private weak var scrollView: UIScrollView?
  private weak var bottomLayoutGuide: UILayoutSupport?
  
  private let keyboardObserver = UnderKeyboardObserver()
  
  private class var shared: UnderKeyboard {
    return tegUnderKeyboard
  }
  
  /**
  
  - parameter scrollView: Supply a scroll view or any of its subclasses. Its bottom inset will be adjusted to the height of the keyboard when it is shown.
  
  - parameter buttonLayoutGuide: Supply an optional bottom layout guide (like a tab bar) that will be used for adjusting  the scroll view insets.
  
  */
  public class func scrollView(scrollView: UIScrollView, bottomLayoutGuide: UILayoutSupport? = nil) {
    shared.scrollView = scrollView
    shared.bottomLayoutGuide = bottomLayoutGuide
  }
  
  private init() {
    keyboardObserver.start()
//    registerForKeyboardNotifications()
    
    keyboardObserver.willAnimate = keyboardWillShow
      
  }
  
  deinit {
//    unRegisterForKeyboardNotifications()
  }
//  
//  private func registerForKeyboardNotifications() {
//    NSNotificationCenter.defaultCenter().addObserver(self,
//      selector: "keyboardDidShow:",
//      name: UIKeyboardDidShowNotification, object: nil)
//    
//    NSNotificationCenter.defaultCenter().addObserver(self,
//      selector: "keyboardWillHide:",
//      name: UIKeyboardWillHideNotification, object: nil)
//  }
//  
//  private func unRegisterForKeyboardNotifications() {
//    NSNotificationCenter.defaultCenter().removeObserver(self)
//  }
  
  func keyboardWillShow(isShowing: Bool, beginHeight: CGFloat, endHeight: CGFloat) {
    if isShowing {
      let layoutGuideHeight = bottomLayoutGuide?.length ?? 0
      let height = endHeight - layoutGuideHeight

      let insets =  UIEdgeInsets(
        top: 0,
        left: 0,
        bottom: height,
        right: 0)

      scrollView?.contentInset = insets
      scrollView?.scrollIndicatorInsets = insets
    } else {
      scrollView?.contentInset = UIEdgeInsetsZero;
      scrollView?.scrollIndicatorInsets = UIEdgeInsetsZero;
    }
  }
  
  func keyboardDidShow(notification: NSNotification) {
    if let userInfo = notification.userInfo,
      let value = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue {

        let layoutGuideHeight = bottomLayoutGuide?.length ?? 0
        let height = value.CGRectValue().size.height - layoutGuideHeight
        
        let insets =  UIEdgeInsets(
          top: 0,
          left: 0,
          bottom: height,
          right: 0)
        
        scrollView?.contentInset = insets
        scrollView?.scrollIndicatorInsets = insets
    }
  }
  
  func keyboardWillHide(notification: NSNotification) {
    scrollView?.contentInset = UIEdgeInsetsZero;
    scrollView?.scrollIndicatorInsets = UIEdgeInsetsZero;
  }
}