import UIKit
import UnderKeyboard

class ViewController: UIViewController {
  @IBOutlet weak var textView: UITextView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    UnderKeyboard.scrollView(textView, bottomLayoutGuide: bottomLayoutGuide)
  }

  @IBAction func onCloseKeyboardTapped(sender: AnyObject) {
    textView.resignFirstResponder()

  }

}

