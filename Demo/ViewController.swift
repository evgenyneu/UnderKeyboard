
import UIKit
import UnderKeyboard

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func didTapCloseKeyboard(sender: AnyObject) {
    view.endEditing(false)
  }
}