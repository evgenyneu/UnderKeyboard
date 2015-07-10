
import UIKit
import XCTest

class UnderKeyboardLayoutConstraintTests: XCTestCase {
  
  var constraint: NSLayoutConstraint!
  var view: UIView!
  var underKeyboardLayoutConstraint: UnderKeyboardLayoutConstraint!
  
  override func setUp() {
    super.setUp()
    
    constraint = NSLayoutConstraint()
    view = UIView()
    underKeyboardLayoutConstraint = UnderKeyboardLayoutConstraint()
  }
  
  func testIncreaseConstraintConstant() {
    constraint.constant = 12
    
    underKeyboardLayoutConstraint.setup(constraint, view: view)
    
    postKeyboardWillShowNotification(CGSize(width: 46, height: 35))
    
    XCTAssertEqual(47, constraint.constant)
    
    postKeyboardWillHideNotification()
    
    XCTAssertEqual(12, constraint.constant)
  }
}