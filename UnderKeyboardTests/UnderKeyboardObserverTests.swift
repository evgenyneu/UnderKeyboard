import UIKit
import XCTest

class UnderKeyboardObserverTests: XCTestCase {
  
  var obj: UnderKeyboardObserver!
  
  override func setUp() {
    super.setUp()
    
    obj = UnderKeyboardObserver()
    obj.start()
  }
  
  
}
