
import UIKit
import UnderKeyboard

class LoginViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func didTapCloseKeyboard(sender: AnyObject) {
    view.endEditing(false)
  }
  
  @IBAction func didTapLoginButton(sender: AnyObject) {
    view.endEditing(false)
  }
}