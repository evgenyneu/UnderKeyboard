
import UIKit
import UnderKeyboard

class LoginViewController: UIViewController {
  @IBOutlet weak var bottomLayoutConstraint: NSLayoutConstraint!
  let underKeyboardLayoutConstraint = UnderKeyboardLayoutConstraint()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    underKeyboardLayoutConstraint.setup(bottomLayoutConstraint, view: view)
  }
  
  @IBAction func didTapCloseKeyboard(_ sender: AnyObject) {
    view.endEditing(false)
  }
  
  @IBAction func didTapLoginButton(_ sender: AnyObject) {
    view.endEditing(false)
  }
}
