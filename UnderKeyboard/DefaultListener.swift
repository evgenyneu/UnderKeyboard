import Foundation

protocol KeyboardNotificiationListener {
    func newNotification(keyboardInfo: KeyboardInfo)
}

extension UnderKeyboard.DefaultObserver {
    
    class NotificationListener {
        
        var delegate: KeyboardNotificiationListener!
        
        private let keyboardNotifications = [
            /*willShow:*/ NSNotification.Name.UIKeyboardWillShow,
            /*didShow:*/ NSNotification.Name.UIKeyboardWillShow,
            /*willHide:*/ NSNotification.Name.UIKeyboardWillHide,
            /*didHide:*/ NSNotification.Name.UIKeyboardDidHide
        ]
        
        init() {            
            keyboardNotifications.forEach { name in
                NotificationCenter.default.addObserver(forName: name, object: nil, queue: nil) { notification in
                    let keyboardInfo = KeyboardInfo(notification: notification)
                    self.delegate.newNotification(keyboardInfo: keyboardInfo)
                }
            }
        }
        
        deinit {
            NotificationCenter.default.removeObserver(self)
        }
    }
    
}
