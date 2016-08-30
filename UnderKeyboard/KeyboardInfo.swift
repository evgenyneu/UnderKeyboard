import UIKit

struct KeyboardInfo {
    
    let animationDuration: Double
    let animationCurve: UIViewAnimationOptions
    
    let frameBegin: CGRect
    let frameEnd: CGRect
    
    init(notification: Notification) {
        let userInfo = (notification as NSNotification).userInfo!
        
        self.animationDuration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        
        let rawAnimationCurve = (userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).uint32Value << 16
        self.animationCurve = UIViewAnimationOptions(rawValue: UInt(rawAnimationCurve))
                
        self.frameBegin = ((userInfo[UIKeyboardFrameBeginUserInfoKey] as AnyObject).cgRectValue)!
        self.frameEnd = ((userInfo[UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue)!
    }
}
