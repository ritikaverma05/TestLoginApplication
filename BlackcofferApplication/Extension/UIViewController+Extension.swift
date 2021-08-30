
import Foundation
import UIKit
import PKHUD

extension UIViewController {
    func showProgressHUD() {
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
    }
    
    func showError(error: String, duration:TimeInterval = 1.0) {
        PKHUD.sharedHUD.contentView = PKHUDTextView(text: error)
        PKHUD.sharedHUD.show()
        PKHUD.sharedHUD.hide(afterDelay: duration)
    }
    
    func hideHUD() {
        PKHUD.sharedHUD.hide(true, completion: nil)
    }
}
