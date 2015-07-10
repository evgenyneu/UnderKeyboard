
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
    
    XCTAssertEqual(45, constraint.constant) // 35 + 10 (default min margin)
    
    postKeyboardWillHideNotification()
    
    XCTAssertEqual(12, constraint.constant)
  }
  
  func testKeepConstantWhenItsBiggerThanKeyboard() {
    constraint.constant = 63
    
    underKeyboardLayoutConstraint.setup(constraint, view: view, minMargin: 10)
    
    postKeyboardWillShowNotification(CGSize(width: 46, height: 50))
    
    XCTAssertEqual(63, constraint.constant)
    
    postKeyboardWillHideNotification()
    
    XCTAssertEqual(63, constraint.constant)
  }
  
  
  func testIncreaseConstraintConstant_whenSetupIsCalledWhenKeyboardIsAlreadyOpen() {
    constraint.constant = 12
    
    postKeyboardWillShowNotification(CGSize(width: 46, height: 50))
    
    underKeyboardLayoutConstraint.setup(constraint, view: view)
    
    XCTAssertEqual(60, constraint.constant) // 35 + 10 (default min margin)
  }
}