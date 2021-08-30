

import Foundation
import UIKit

extension String {

    var isEmailValid: Bool{
        
        let EmailRegExp = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$"
        let EmailCheck = NSPredicate(format: "SELF MATCHES %@", EmailRegExp)
        return EmailCheck.evaluate(with: self)
    }
    
}
