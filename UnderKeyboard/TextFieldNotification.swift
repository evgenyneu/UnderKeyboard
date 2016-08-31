import UIKit

struct TextFieldNotification {
    let name: Name
    
    init(notification: Notification) {
        self.name = Name(notificationName: notification.name)!
    }
}

extension TextFieldNotification {
    enum Name {
        case beganEditing
        case changed
        case endedEditing
    }
}

extension TextFieldNotification.Name {
    init?(notificationName: NSNotification.Name) {
        let mapping: (NSNotification.Name) -> TextFieldNotification.Name? = { name in
            switch name {
            case NSNotification.Name.UITextFieldTextDidBeginEditing:
                return .beganEditing
            case NSNotification.Name.UITextFieldTextDidChange:
                return .changed
            case NSNotification.Name.UITextFieldTextDidEndEditing:
                return .endedEditing
            default:
                return nil
            }
        }
        
        guard let name = mapping(notificationName) else {
            return nil
        }
        self = name
    }
}
