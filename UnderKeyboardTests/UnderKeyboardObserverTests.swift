import UIKit
import XCTest

class UnderKeyboardObserverTests: XCTestCase {
  
  var obj: UnderKeyboardObserver!
  
  override func setUp() {
    super.setUp()
    
    obj = UnderKeyboardObserver()
    
  }
  
  // MARK: - Will animate keyboard
  
  func testCallsWillAnimateKeyboard_willShow() {
    obj.start()
    
    var heightReceived: CGFloat?
    var timesCalled = 0
    
    obj.willAnimateKeyboard = { height in
      heightReceived = height
      timesCalled += 1
    }
    
    postKeyboardWillShowNotification(CGSize(width: 18, height: 27))
    
    XCTAssertEqual(1, timesCalled)
    XCTAssertEqual(27, heightReceived!)
  }
  
  func testCallsWillAnimateKeyboard_willHide() {
    obj.start()
    
    var heightReceived: CGFloat?
    var timesCalled = 0
    
    obj.willAnimateKeyboard = { height in
      heightReceived = height
      timesCalled += 1
    }
    
    postKeyboardWillHideNotification()
    
    XCTAssertEqual(1, timesCalled)
    XCTAssertEqual(0, heightReceived!)
  }
  
  // MARK: - Animate keyboard
  
  func testCallsAnimateKeyboard_willShow() {
    obj.start()
    
    var heightReceived: CGFloat?
    var timesCalled = 0
    
    obj.animateKeyboard = { height in
      heightReceived = height
      timesCalled += 1
    }
    
    postKeyboardWillShowNotification(CGSize(width: 18, height: 27))
    
    XCTAssertEqual(1, timesCalled)
    XCTAssertEqual(27, heightReceived!)
  }
  
  func testCallsAnimateKeyboard_willHide() {
    obj.start()
    
    var heightReceived: CGFloat?
    var timesCalled = 0
    
    obj.animateKeyboard = { height in
      heightReceived = height
      timesCalled += 1
    }
    
    postKeyboardWillHideNotification()
    
    XCTAssertEqual(1, timesCalled)
    XCTAssertEqual(0, heightReceived!)
  }
  
  // MARK: - Current keyboard height
  
  func testCurrentKeyboardHeight() {
    obj.start()
    
    XCTAssert(obj.currentKeyboardHeight == nil)
    
    postKeyboardWillShowNotification(CGSize(width: 18, height: 132))
    
    XCTAssertEqual(132, obj.currentKeyboardHeight!)
    
    postKeyboardWillHideNotification()
    
    XCTAssertEqual(0, obj.currentKeyboardHeight!)
  }
}
