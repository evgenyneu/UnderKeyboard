import UIKit
import UnderKeyboard

class ViewController: UIViewController {
  @IBOutlet weak var textView: UITextView!
  var underKeyboardScrollView = UnderKeyboardScrollView()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    underKeyboardScrollView.setup(textView, bottomLayoutGuide: bottomLayoutGuide)
  }

  @IBAction func onCloseKeyboardTapped(sender: AnyObject) {
    textView.resignFirstResponder()
  }
}

