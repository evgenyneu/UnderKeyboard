import UIKit

extension UnderKeyboard.DefaultObserver: KeyboardNotificiationListener {
    
    func newNotification(notification: KeyboardNotification) {
        assert(UnderKeyboard.useDefaultImplementationIfNoneProvided) // remove this after this is merged into marketplacer/UnderKeyboard

        // do bad side effecty things here with UIScreen.main
        switch notification.name {
        case .willShow:
            break
        case .didShow:
            break
        case .willHide:
            break
        case .didHide:
            break
        }
    }
    
    func newNotification(notification: TextFieldNotification) {
        assert(UnderKeyboard.useDefaultImplementationIfNoneProvided) // remove this after this is merged into marketplacer/UnderKeyboard
        
        // or maybe do the side effecty things here for now?
        switch notification.name {
        case .beganEditing:
            let keyboardWillCoverField = false
            guard keyboardWillCoverField else {
                return
            }
            
            let minDistanceToMoveScreenUpAsToNotHaveTheFieldCovered: CGFloat = 0
            animateScreen(delta: minDistanceToMoveScreenUpAsToNotHaveTheFieldCovered, duration: 1)
        case .changed:
            break
        case .endedEditing:
            resetScreenDelta(duration: 1)
        }
        
    }
    
}

extension UnderKeyboard.DefaultObserver {
    func animateScreen(delta: CGFloat, duration: TimeInterval, completion: () -> () = {}) {
        
    }
    
    func resetScreenDelta(duration: TimeInterval, completion: () -> () = {}) {
        
    }
}
