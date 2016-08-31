import Foundation

class UnderKeyboard {
    
    static var useDefaultImplementationIfNoneProvided: Bool = false {
        didSet {
            switch (oldValue, useDefaultImplementationIfNoneProvided) {
            case (false, true):
                UnderKeyboard.sharedDefaultObserver = DefaultObserver()
            case (true, false):
                UnderKeyboard.sharedDefaultObserver = nil
            case (true, true), (false, false):
                break
            }
        }
    }
    
    private static var sharedDefaultObserver: DefaultObserver?
    
    class DefaultObserver {
        private let notificationListener: NotificationListener
        
        init() {
            self.notificationListener = NotificationListener()
            self.notificationListener.delegate = self // I dont like that this is a delegate. I'd rather use Rx, but I don't want to import a 3rd party dependency.
        }
        
        deinit {}
        
    }
    
}
