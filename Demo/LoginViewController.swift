
import UIKit
import UnderKeyboard

class LoginViewController: UIViewController {
  @IBOutlet weak var bottomLayoutConstraint: NSLayoutConstraint!
  var initialBottomConstraintConstant: CGFloat = 0
  var underKeyboardObserver = UnderKeyboardObserver()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    underKeyboardObserver.start()
    
    initialBottomConstraintConstant = bottomLayoutConstraint.constant
    underKeyboardObserver.willAnimate = keyboardWillAnimate
    underKeyboardObserver.animate = keyboardAnimate
  }
  
  @IBAction func didTapCloseKeyboard(sender: AnyObject) {
    view.endEditing(false)
  }
  
  @IBAction func didTapLoginButton(sender: AnyObject) {
    view.endEditing(false)
  }
  
  func keyboardWillAnimate(isShowing: Bool, height: CGFloat) {
    let correctedHeight = height - bottomLayoutGuide.length
    
    if isShowing {
      bottomLayoutConstraint.constant = correctedHeight + initialBottomConstraintConstant
    } else {
      bottomLayoutConstraint.constant = initialBottomConstraintConstant
    }
  }
  
  func keyboardAnimate(isShowing: Bool, height: CGFloat) {
    view.layoutIfNeeded()
  }
}