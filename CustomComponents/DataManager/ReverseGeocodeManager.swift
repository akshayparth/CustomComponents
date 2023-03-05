//
//  ReverseGeocodeManager.swift
//  LocationPicker
//

import Foundation
import CoreLocation

class ReverseGeocodeManager {
    private var geoCoder: CLGeocoder?
    private weak var reverseGeocodeResulsHandler: ReverseGeocodeResultsHandlerDelegate?
    
    init(with reverseGeocodeResulsHandler:  ReverseGeocodeResultsHandlerDelegate) {
        self.reverseGeocodeResulsHandler = reverseGeocodeResulsHandler
    }
    
    func reverseGeocode(location: CLLocation) {
        if geoCoder == nil {
            geoCoder = CLGeocoder()
        }
        
        geoCoder?.reverseGeocodeLocation(location, completionHandler: { [weak self](placemarks, error) in
            guard let weakSelf = self else {
                return
            }
            DispatchQueue.main.async {
                if let error = error {
                    weakSelf.reverseGeocodeResulsHandler?.onReverseGeocodeNoLocationsFound(dueTo: error)
                } else {
                    if let placemarks = placemarks, placemarks.count > 0 {
                        weakSelf.reverseGeocodeResulsHandler?.onReverseGeocodeLocationsFound(placemarks: placemarks)
                    } else {
                        weakSelf.reverseGeocodeResulsHandler?.onReverseGeocodeNoLocationsFound()
                    }
                }
            }
            
        })
    }
}
