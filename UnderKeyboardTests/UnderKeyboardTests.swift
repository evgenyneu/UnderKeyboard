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
    
    postKeyboardWillShowNotification(CGSize(width: 49, height: 51))
    
    XCTAssertEqual(51, scrollView.contentInset.bottom)
    XCTAssertEqual(51, scrollView.scrollIndicatorInsets.bottom)
        
    postKeyboardWillHideNotification()
    
    XCTAssertEqual(0, scrollView.contentInset.bottom)
    XCTAssertEqual(0, scrollView.scrollIndicatorInsets.bottom)
  }
}
