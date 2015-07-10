public final class UnderKeyboardObserver: NSObject {
  public typealias AnimationCallback = (isShowing: Bool, beginHeight: CGFloat, endHeight: CGFloat) -> ()
  public typealias AnimationEnd = (isShowing: Bool, finished: Bool, beginHeight: CGFloat, endHeight: CGFloat) -> ()
  
  let notificationCenter: NSNotificationCenter
  
  public var willAnimate: AnimationCallback?
  public var animate: AnimationCallback?
  public var didAnimate: AnimationEnd?
  
  public override init() {
    notificationCenter = NSNotificationCenter.defaultCenter()
    super.init()
  }
  
  deinit {
    stop()
  }
  
  public func start() {
    stop()
    
    notificationCenter.addObserver(self, selector: Selector("keyboardNotification:"), name:UIKeyboardWillShowNotification, object: nil);
    notificationCenter.addObserver(self, selector: Selector("keyboardNotification:"), name:UIKeyboardWillHideNotification, object: nil);
  }
  
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