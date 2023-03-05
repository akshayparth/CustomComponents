//
//  GeocodeManager.swift
//  LocationPicker
//

import Foundation
import CoreLocation

class GeocodeManager {
    private var geoCoder: CLGeocoder?
    private weak var geocodeResulsHandler: GeocodeResultsHandlerDelegate?
    
    init(with geocodeResulsHandler:  GeocodeResultsHandlerDelegate) {
        self.geocodeResulsHandler = geocodeResulsHandler
    }
    
    func geocode(address: String) {
        guard address.count > 3 else {
            return
        }
        
        if geoCoder == nil {
            geoCoder = CLGeocoder()
        }
        geoCoder?.geocodeAddressString(address, completionHandler: { [weak self](placemarks, error) in
            guard let weakSelf = self else {
                return
            }
            DispatchQueue.main.async {
                if let error = error {
                    weakSelf.geocodeResulsHandler?.onGeocodeNoLocationsFound(dueTo: error)
                } else {
                    if let placemarks = placemarks, placemarks.count > 0 {
                        weakSelf.geocodeResulsHandler?.onGeocodeLocationsFound(placemarks: placemarks)
                    } else {
                        weakSelf.geocodeResulsHandler?.onGeocodeNoLocationsFound()
                    }
                }
            }
        })
        
    }
}
