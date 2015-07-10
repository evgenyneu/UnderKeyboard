import UIKit

@objc
/**

Moves scroll view content from under the keyboard on iOS. It adjusts the bottom inset of the scroll view by the height of the keyboard when it is shown.

*/
public class UnderKeyboardScrollView {
  private weak var scrollView: UIScrollView?
  private weak var bottomLayoutGuide: UILayoutSupport?
  private let keyboardObserver = UnderKeyboardObserver()
  
  public init() {
    keyboardObserver.willAnimateKeyboard = keyboardWillAnimate
    keyboardObserver.start()
  }
  
  deinit {
    stop()
  }
  
  
  /// Stop listening for keyboard notifications.
  public func stop() {
    keyboardObserver.stop()
  }
  
  /**
  
  Supply a scroll view object. Its bottom inset will be adjusted by the height of the keyboard when it appears and hides.
  
  - parameter scrollView: Supply a scroll view or any of its subclasses. Its bottom inset will be adjusted to the height of the keyboard when it is shown.
  
  - parameter bottomLayoutGuide: Supply an optional bottom layout guide (like a tab bar) that will be used for adjusting  the scroll view insets.
  
  */
  public func setup(scrollView: UIScrollView, bottomLayoutGuide: UILayoutSupport? = nil) {
    self.scrollView = scrollView
    self.bottomLayoutGuide = bottomLayoutGuide
  }
  
  func keyboardWillAnimate(isShowing: Bool, height: CGFloat) {
    if isShowing {
      let layoutGuideHeight = bottomLayoutGuide?.length ?? 0
      let height = height - layoutGuideHeight

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
}