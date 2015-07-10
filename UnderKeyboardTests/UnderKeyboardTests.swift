import UIKit
import XCTest

class UnderKeyboardTests: XCTestCase {
  
  var scrollView: UIScrollView!
  var underKeyboardScrollView: UnderKeyboardScrollView!
  
  override func setUp() {
    super.setUp()
    
    scrollView = UIScrollView()
    underKeyboardScrollView = UnderKeyboardScrollView()
  }
  
  func testAddAndRemoveInsetsWhenKeyboardShowsAndHides() {
    underKeyboardScrollView.setup(scrollView)
    
    let rect = CGRect(origin: CGPoint(), size: CGSize(width: 49, height: 51))
    let rectValue = NSValue(CGRect: rect)
        
    let userInfo = [
      UIKeyboardFrameEndUserInfoKey: rectValue,
      UIKeyboardAnimationDurationUserInfoKey: NSNumber(double: 0),
      UIKeyboardAnimationCurveUserInfoKey: NSNumber(int: 0)
    ]
    
    // Keyboard shows
    
    NSNotificationCenter.defaultCenter().postNotificationName(UIKeyboardWillShowNotification,
      object: self, userInfo: userInfo)
    
    XCTAssertEqual(51, scrollView.contentInset.bottom)
    XCTAssertEqual(51, scrollView.scrollIndicatorInsets.bottom)
    
    // Keyboard hides
    
    NSNotificationCenter.defaultCenter().postNotificationName(UIKeyboardWillHideNotification,
      object: self, userInfo: userInfo)
    
    XCTAssertEqual(0, scrollView.contentInset.bottom)
    XCTAssertEqual(0, scrollView.scrollIndicatorInsets.bottom)
  }
}
