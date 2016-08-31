import UIKit

struct KeyboardNotification {
    let name: Name
    
    let animationDuration: Double
    let animationCurve: UIViewAnimationOptions
    
    let frameBegin: CGRect
    let frameEnd: CGRect
    
    init(notification: Notification) {
        let userInfo = (notification as NSNotification).userInfo!
        
        self.name = Name(notificationName: notification.name)!
        
        self.animationDuration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        
        let rawAnimationCurve = (userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).uint32Value << 16
        self.animationCurve = UIViewAnimationOptions(rawValue: UInt(rawAnimationCurve))
        
        self.frameBegin = ((userInfo[UIKeyboardFrameBeginUserInfoKey] as AnyObject).cgRectValue)!
        self.frameEnd = ((userInfo[UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue)!
    }
}

extension KeyboardNotification {
    enum Name {
        case willShow
        case didShow
        case willHide
        case didHide
    }
}

extension KeyboardNotification.Name {
    init?(notificationName: NSNotification.Name) {
        let mapping: (NSNotification.Name) -> KeyboardNotification.Name? = { name in
            switch name {
            case NSNotification.Name.UIKeyboardWillShow:
                return .willShow
            case NSNotification.Name.UIKeyboardDidShow:
                return .didShow
            case NSNotification.Name.UIKeyboardWillHide:
                return .willHide
            case NSNotification.Name.UIKeyboardDidHide:
                return .didHide
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
