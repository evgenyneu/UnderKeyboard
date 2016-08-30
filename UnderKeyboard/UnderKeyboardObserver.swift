import UIKit

/**
 
 Detects appearance of software keyboard and calls the supplied closures that can be used for changing the layout and moving view from under the keyboard.
 
 */
extension UnderKeyboard {
    public final class Observer: NSObject {
        public typealias AnimationCallback = (_ height: CGFloat) -> ()
        
        let notificationCenter: NotificationCenter
        
        /// Function that will be called before the keyboard is shown and before animation is started.
        public var willAnimateKeyboard: AnimationCallback?
        
        /// Function that will be called inside the animation block. This can be used to call `layoutIfNeeded` on the view.
        public var animateKeyboard: AnimationCallback?
        
        /// Current height of the keyboard. Has value `nil` if unknown.
        public var currentKeyboardHeight: CGFloat?
        
        /// Creates an instance of the class
        public override init() {
            notificationCenter = NotificationCenter.default
            super.init()
        }
        
        deinit {
            stop()
        }
        
        /// Start listening for keyboard notifications.
        public func start() {
            stop()
            
            notificationCenter.addObserver(self, selector: #selector(UnderKeyboard.Observer.keyboardNotification(_:)), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
            notificationCenter.addObserver(self, selector: #selector(UnderKeyboard.Observer.keyboardNotification(_:)), name:NSNotification.Name.UIKeyboardWillHide, object: nil);
        }
        
        /// Stop listening for keyboard notifications.
        public func stop() {
            notificationCenter.removeObserver(self)
        }
        
        // MARK: - Notification
        
        func keyboardNotification(_ notification: Notification) {
            let isShowing = notification.name == NSNotification.Name.UIKeyboardWillShow
            
            if let userInfo = (notification as NSNotification).userInfo,
                let height = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height,
                let duration: TimeInterval = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue,
                let animationCurveRawNSN = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber {
                
                let correctedHeight = isShowing ? height : 0
                willAnimateKeyboard?(correctedHeight)
                
                UIView.animate(withDuration: duration,
                               delay: TimeInterval(0),
                               options: UIViewAnimationOptions(rawValue: animationCurveRawNSN.uintValue),
                               animations: { [weak self] in
                                self?.animateKeyboard?(correctedHeight)
                    },
                               completion: nil
                )
                
                currentKeyboardHeight = correctedHeight
            }
        }
    }
}
