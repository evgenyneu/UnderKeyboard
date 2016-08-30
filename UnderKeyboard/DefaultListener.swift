import Foundation

protocol KeyboardNotificiationListener {
    func newNotification(notification: KeyboardNotification)
}

extension UnderKeyboard.DefaultObserver {
    
    class NotificationListener {
        
        var delegate: KeyboardNotificiationListener!
        
        private let keyboardNotifications = [
            /*willShow:*/ NSNotification.Name.UIKeyboardWillShow,
            /*didShow:*/ NSNotification.Name.UIKeyboardDidShow,
            /*willHide:*/ NSNotification.Name.UIKeyboardWillHide,
            /*didHide:*/ NSNotification.Name.UIKeyboardDidHide
        ]
        
        init() {            
            keyboardNotifications.forEach { name in
                NotificationCenter.default.addObserver(forName: name, object: nil, queue: nil) { notification in
                    let keyboardInfo = KeyboardNotification(notification: notification)
                    self.delegate.newNotification(notification: keyboardInfo)
                }
            }
        }
        
        deinit {
            NotificationCenter.default.removeObserver(self)
        }
    }
    
}
