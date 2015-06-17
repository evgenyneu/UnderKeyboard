import UIKit
import UnderKeyboard

class ViewController: UIViewController {
  @IBOutlet weak var textView: UITextView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    UnderKeyboard.scrollView(textView)
  }
  
  @IBAction func onDoneTapped(sender: AnyObject) {
    textView.resignFirstResponder()
  }
}

