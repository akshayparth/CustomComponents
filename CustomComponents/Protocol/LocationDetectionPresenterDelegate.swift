//
//  LocationPermissionPresenterDelegate.swift
//  LocationPicker
//

import UIKit

protocol LocationPermissionPresenterDelegate: AnyObject {
    func alertUserForLocationPermission()
    var customAlertEnableLocationTitle: String { get }
    var customAlertEnableLocationMessage: String { get }
    var customAlertEnableLocationCancelTitle: String { get }
    var customAlertEnableLocationOpenSettingsTitle: String { get }
}

extension LocationPermissionPresenterDelegate where Self: UIViewController {
    // Default titles
    var customAlertEnableLocationTitle: String { return "Location Access Disabled!" }
    var customAlertEnableLocationMessage: String { return "Please enable location services from settings so that we can detect your current location." }
    var customAlertEnableLocationCancelTitle: String { return "Cancel" }
    var customAlertEnableLocationOpenSettingsTitle: String { return "Open Settings" }
    
    // Default implementation
    func alertUserForLocationPermission() {
        let alertController = UIAlertController(
            title: customAlertEnableLocationTitle,
            message: customAlertEnableLocationMessage,
            preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: customAlertEnableLocationCancelTitle, style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let openAction = UIAlertAction(title: customAlertEnableLocationOpenSettingsTitle, style: .default) { (action) in
            if let url = URL(string:UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: { (success) in
                    if success {
                        
                    }
                })
            }
        }
        alertController.addAction(openAction)
        present(alertController, animated: true, completion: nil)
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
}
