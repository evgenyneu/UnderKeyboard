
import UIKit
import UnderKeyboard

class LoginViewController: UIViewController {
  @IBOutlet weak var bottomLayoutConstraint: NSLayoutConstraint!
  var underKeyboardLayoutConstraint: UnderKeyboardLayoutConstraint?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    underKeyboardLayoutConstraint = UnderKeyboardLayoutConstraint()
    underKeyboardLayoutConstraint?.setup(bottomLayoutConstraint, view: view,
      bottomLayoutGuide: bottomLayoutGuide)
  }
  
  @IBAction func didTapCloseKeyboard(sender: AnyObject) {
    view.endEditing(false)
  }
  
  @IBAction func didTapLoginButton(sender: AnyObject) {
    view.endEditing(false)
  }
}