import UIKit
import UnderKeyboard

class ScrollViewController: UIViewController {
  @IBOutlet weak var textView: UITextView!
  var underKeyboardLayoutConstraint: UnderKeyboardLayoutConstraint?

  @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    underKeyboardLayoutConstraint = UnderKeyboardLayoutConstraint()
    
    underKeyboardLayoutConstraint?.setup(bottomConstraint, view: view,
      bottomLayoutGuide: bottomLayoutGuide)
  }
  
  @IBAction func didTapCloseJKeyboard(sender: AnyObject) {
    textView.resignFirstResponder()
  }
}

