import UIKit

@objc
/**

Adjusts the length (constant value) of the bottom layout constraint when keyboard shows and hides.

*/
public class UnderKeyboardLayoutConstraint {
  private weak var bottomLayoutConstraint: NSLayoutConstraint?
  private weak var bottomLayoutGuide: UILayoutSupport?
  private let keyboardObserver = UnderKeyboardObserver()
  private var initialConstraintConstant: CGFloat = 0
  private var minMargin: CGFloat = 10
  
  private var viewToAnimate: UIView?
  
  public init() {
    keyboardObserver.willAnimateKeyboard = keyboardWillAnimate
    keyboardObserver.animateKeyboard = animateKeyboard
  }
  
  deinit {
    stop()
  }
  
  /// Stop listening for keyboard notifications.
  public func stop() {
    keyboardObserver.stop()
  }
  
  /**
  
  - parameter constraint: Supply a bottom layout constraint. Its constant value will be adjusted when keyboard is shown and hidden.
  - parameter view: Supply a view that will be used to animate the constraint. It is usually the superview containing the view with the constraint.
  - parameter minMargin: Specify the minimum margin between the keyboard and the bottom of the view the constraint is attached to. Default: 10.
  - parameter buttonLayoutGuide: Supply an optional bottom layout guide (like a tab bar) that will be taken into account during height calculations.
  
  */
  public func setup(bottomLayoutConstraint: NSLayoutConstraint,
    view: UIView, minMargin: CGFloat = 10,
    bottomLayoutGuide: UILayoutSupport? = nil) {
      
    initialConstraintConstant = bottomLayoutConstraint.constant
    self.bottomLayoutConstraint = bottomLayoutConstraint
    self.minMargin = minMargin
    self.bottomLayoutGuide = bottomLayoutGuide
    self.viewToAnimate = view
    keyboardObserver.start()
  }
  
  func keyboardWillAnimate(isShowing: Bool, height: CGFloat) {
    guard let bottomLayoutConstraint = bottomLayoutConstraint else { return }
    
    let layoutGuideHeight = bottomLayoutGuide?.length ?? 0
    let correctedHeight = height - layoutGuideHeight
    
    if isShowing {
      let newConstantValue = correctedHeight + minMargin
      if newConstantValue > bottomLayoutConstraint.constant {
        bottomLayoutConstraint.constant = newConstantValue
      }
    } else {
      bottomLayoutConstraint.constant = initialConstraintConstant
    }
  }
  
  func animateKeyboard(isShowing: Bool, height: CGFloat) {
    viewToAnimate?.layoutIfNeeded()
  }
}