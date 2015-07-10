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
    
    var isShowingReceived: Bool?
    var heightReceived: CGFloat?
    var timesCalled = 0
    
    obj.willAnimateKeyboard = { isShowing, height in
      isShowingReceived = isShowing
      heightReceived = height
      timesCalled += 1
    }
    
    postKeyboardWillShowNotification(CGSize(width: 18, height: 27))
    
    XCTAssertEqual(1, timesCalled)
    XCTAssert(isShowingReceived!)
    XCTAssertEqual(27, heightReceived!)
  }
  
  func testCallsWillAnimateKeyboard_willHide() {
    obj.start()
    
    var isShowingReceived: Bool?
    var heightReceived: CGFloat?
    var timesCalled = 0
    
    obj.willAnimateKeyboard = { isShowing, height in
      isShowingReceived = isShowing
      heightReceived = height
      timesCalled += 1
    }
    
    postKeyboardWillHideNotification()
    
    XCTAssertEqual(1, timesCalled)
    XCTAssertFalse(isShowingReceived!)
    XCTAssertEqual(0, heightReceived!)
  }
  
  // MARK: - Animate keyboard
  
  func testCallsAnimateKeyboard_willShow() {
    obj.start()
    
    var isShowingReceived: Bool?
    var heightReceived: CGFloat?
    var timesCalled = 0
    
    obj.animateKeyboard = { isShowing, height in
      isShowingReceived = isShowing
      heightReceived = height
      timesCalled += 1
    }
    
    postKeyboardWillShowNotification(CGSize(width: 18, height: 27))
    
    XCTAssertEqual(1, timesCalled)
    XCTAssert(isShowingReceived!)
    XCTAssertEqual(27, heightReceived!)
  }
  
  func testCallsAnimateKeyboard_willHide() {
    obj.start()
    
    var isShowingReceived: Bool?
    var heightReceived: CGFloat?
    var timesCalled = 0
    
    obj.animateKeyboard = { isShowing, height in
      isShowingReceived = isShowing
      heightReceived = height
      timesCalled += 1
    }
    
    postKeyboardWillHideNotification()
    
    XCTAssertEqual(1, timesCalled)
    XCTAssertFalse(isShowingReceived!)
    XCTAssertEqual(0, heightReceived!)
  }
}
