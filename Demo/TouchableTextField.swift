import UIKit


/*

A text field with enlarged touch target for easier selection.

*/
class TouchableTextField: UITextField {
  /// Increase the hitsize of the image view if it's less than 44px for easier tapping.
  override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
    let oprimizedBounds = LargeTouchTarget.optimize(bounds)
    return oprimizedBounds.contains(point)
  }
}
