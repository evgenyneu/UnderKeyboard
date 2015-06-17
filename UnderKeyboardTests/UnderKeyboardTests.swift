import UIKit
import XCTest

class UnderKeyboardTests: XCTestCase {
  
  var scrollView: UIScrollView!
  
  override func setUp() {
    super.setUp()
    
    scrollView = UIScrollView()
  }
  
  func testAddAndRemoveInsetsWhenKeyboardShowsAndHides() {
    UnderKeyboard.scrollView(scrollView)
    
    let rect = CGRect(origin: CGPoint(), size: CGSize(width: 49, height: 51))
    let rectValue = NSValue(CGRect: rect)
    let userInfo = [UIKeyboardFrameBeginUserInfoKey: rectValue]
    
    // Keyboard shows
    
    NSNotificationCenter.defaultCenter().postNotificationName(UIKeyboardDidShowNotification,
      object: self, userInfo: userInfo)
    
    XCTAssertEqual(51, scrollView.contentInset.bottom)
    XCTAssertEqual(51, scrollView.scrollIndicatorInsets.bottom)
    
    // Keyboard hides
    
    NSNotificationCenter.defaultCenter().postNotificationName(UIKeyboardWillHideNotification,
      object: self)
    
    XCTAssertEqual(0, scrollView.contentInset.bottom)
    XCTAssertEqual(0, scrollView.scrollIndicatorInsets.bottom)
  }
}
