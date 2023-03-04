//
//  UIViewController+Utilities.swift
//  LocationPicker
//

import UIKit

public extension UIViewController {
    func display(error: Error, with title: String = NSLocalizedString("Error", comment: ""), completion: (()->Void)? = nil) {
        displayError(message: error.localizedDescription, title: title, completion: completion)
    }
    
    func displayError(message: String, title: String = NSLocalizedString("Error", comment: ""), completion: (()->Void)? = nil) {
        displayOkButtonAlert(title: title, message: message, completion: completion)
    }
    
    func displayOkButtonAlert(title: String, message: String, completion: (()->Void)? = nil) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: NSLocalizedString("ok", comment: ""), style: .cancel) { (action:UIAlertAction) in
            completion?()
        }
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}
