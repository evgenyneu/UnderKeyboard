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
            break
        case .changed:
            break
        case .endedEditing:
            break
        }
        
    }
    
}
