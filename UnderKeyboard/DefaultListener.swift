import Foundation

protocol KeyboardNotificiationListener {
    func newNotification(notification: KeyboardNotification)
    func newNotification(notification: TextFieldNotification)
}

extension UnderKeyboard.DefaultObserver {
    
    class NotificationListener {
        
        var delegate: KeyboardNotificiationListener!
        
        private let keyboardNotificationNames = [
            /*willShow:*/ NSNotification.Name.UIKeyboardWillShow,
            /*didShow:*/ NSNotification.Name.UIKeyboardDidShow,
            /*willHide:*/ NSNotification.Name.UIKeyboardWillHide,
            /*didHide:*/ NSNotification.Name.UIKeyboardDidHide
        ]
        
        private let textFieldNotificationNames = [
            /*beganEditing:*/ NSNotification.Name.UITextFieldTextDidBeginEditing,
            /*changed:*/ NSNotification.Name.UITextFieldTextDidChange,
            /*endedEditing:*/ NSNotification.Name.UITextFieldTextDidEndEditing,
        ]
        
        init() {            
            keyboardNotificationNames.forEach { name in
                NotificationCenter.default.addObserver(forName: name, object: nil, queue: nil) { notification in
                    let keyboardInfo = KeyboardNotification(notification: notification)
                    self.delegate.newNotification(notification: keyboardInfo)
                }
            }
            
            textFieldNotificationNames.forEach { name in
                NotificationCenter.default.addObserver(forName: name, object: nil, queue: nil) { notification in
                    let keyboardInfo = TextFieldNotification(notification: notification)
                    self.delegate.newNotification(notification: keyboardInfo)
                }
            }
        }
        
        deinit {
            NotificationCenter.default.removeObserver(self)
        }
    }
    
}
