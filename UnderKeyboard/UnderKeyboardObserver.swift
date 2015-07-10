import UIKit

/**

Detects appearance of software keyboard and calls the supplied closures that can be used for changing the layout and moving view from under the keyboard.

*/
public final class UnderKeyboardObserver: NSObject {
  public typealias AnimationCallback = (isShowing: Bool, height: CGFloat) -> ()
  
  let notificationCenter: NSNotificationCenter
  
  /// Function that will be called before the keyboard is shown and before animation is started.
  public var willAnimateKeyboard: AnimationCallback?
  
  /// Function that will be called inside the animation block. This can be used to call `layoutIfNeeded` on the view.
  public var animateKeyboard: AnimationCallback?
  
  /// Current height of the keyboard. Has value `nil` if unknown.
  public var currentKeyboardHeight: CGFloat?
  
  public override init() {
    notificationCenter = NSNotificationCenter.defaultCenter()
    super.init()
  }
  
  deinit {
    stop()
  }
  
  /// Start listening for keyboard notifications.
  public func start() {
    stop()
    
    notificationCenter.addObserver(self, selector: Selector("keyboardNotification:"), name:UIKeyboardWillShowNotification, object: nil);
    notificationCenter.addObserver(self, selector: Selector("keyboardNotification:"), name:UIKeyboardWillHideNotification, object: nil);
  }
  
  /// Stop listening for keyboard notifications.
  public func stop() {
    notificationCenter.removeObserver(self)
  }
  
  // MARK: - Notification
  
  func keyboardNotification(notification: NSNotification) {
    let isShowing = notification.name == UIKeyboardWillShowNotification
    
    if let userInfo = notification.userInfo,
      let height = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.CGRectValue().height,
      let duration: NSTimeInterval = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue,
      let animationCurveRawNSN = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber {
        
      willAnimateKeyboard?(isShowing: isShowing, height: height)
        
      UIView.animateWithDuration(duration,
        delay: NSTimeInterval(0),
        options: UIViewAnimationOptions(rawValue: animationCurveRawNSN.unsignedLongValue),
        animations: { [weak self] in
          self?.animateKeyboard?(isShowing: isShowing, height: height)
        },
        completion: nil
      )
        
      currentKeyboardHeight = height
    }
  }
}