/**

Detects appearance of software keyboard and calls the supplied closures that can be used for changing the layout and animation.

*/
public final class UnderKeyboardObserver: NSObject {
  public typealias AnimationCallback = (isShowing: Bool, beginHeight: CGFloat, endHeight: CGFloat) -> ()
  public typealias AnimationEnd = (isShowing: Bool, finished: Bool, beginHeight: CGFloat, endHeight: CGFloat) -> ()
  
  let notificationCenter: NSNotificationCenter
  
  /// Function that will be called before the keyboad is shown and before animation is started.
  public var willAnimate: AnimationCallback?
  
  /// Function that will be called inside the animation block.
  public var animate: AnimationCallback?
  
  /// Function that will be called when the keyboard animation finishes.
  public var didAnimate: AnimationEnd?
  
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
      let beginHeigth = (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue().height,
      let endHeight = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.CGRectValue().height,
      let duration: NSTimeInterval = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue,
      let animationCurveRawNSN = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber {
          
      willAnimate?(isShowing: isShowing, beginHeight: beginHeigth, endHeight: endHeight)
        
      UIView.animateWithDuration(duration,
        delay: NSTimeInterval(0),
        options: UIViewAnimationOptions(rawValue: animationCurveRawNSN.unsignedLongValue),
        animations: { [weak self] in
          self?.animate?(isShowing: isShowing, beginHeight: beginHeigth, endHeight: endHeight)
        },
        completion: { [weak self] finished in
          self?.didAnimate?(isShowing: isShowing, finished: finished, beginHeight: beginHeigth, endHeight: endHeight)
        }
      )
    }
  }
}