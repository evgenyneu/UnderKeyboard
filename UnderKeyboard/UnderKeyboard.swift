import UIKit

let tegUnderKeyboard = UnderKeyboard()

@objc
public class UnderKeyboard {
  
  private weak var scrollView: UIScrollView?
  
  private class var shared: UnderKeyboard {
    return tegUnderKeyboard
  }
  
  public class func scrollView(scrollView: UIScrollView) {
    shared.scrollView = scrollView
  }
  
  private init() {
    registerForKeyboardNotifications()
  }
  
  deinit {
    unRegisterForKeyboardNotifications()
  }
  
  private func registerForKeyboardNotifications() {
    NSNotificationCenter.defaultCenter().addObserver(self,
      selector: "keyboardDidShow:",
      name: UIKeyboardDidShowNotification, object: nil)
    
    NSNotificationCenter.defaultCenter().addObserver(self,
      selector: "keyboardWillHide:",
      name: UIKeyboardWillHideNotification, object: nil)
  }
  
  private func unRegisterForKeyboardNotifications() {
    NSNotificationCenter.defaultCenter().removeObserver(self)
  }
  
  func keyboardDidShow(notification: NSNotification) {
    if let userInfo = notification.userInfo,
      let value = userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue {

      let height = value.CGRectValue().size.height - tabBarHeigh
      
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
  
  private var tabBarHeigh: CGFloat {
    if let tabBarController = UIApplication.sharedApplication().delegate?.window??.rootViewController as? UITabBarController {
      return tabBarController.tabBar.frame.height
    }
    
    return 0
  }
}