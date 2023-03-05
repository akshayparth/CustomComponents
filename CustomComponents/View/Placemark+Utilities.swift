//
//  Placemark+Utilities.swift
//  LocationPicker
//

import Foundation
import CoreLocation

public extension CLPlacemark {
     var address: String? {
        var dataArray = [String]()
        if let locality = locality {
            dataArray.append(locality)
        }
        if let subLocality = subLocality {
            dataArray.append(subLocality)
        }
        if let administrativeArea = administrativeArea {
            dataArray.append(administrativeArea)
        }
        if let country = country {
            dataArray.append(country)
        }
        if let postalCode = postalCode {
            dataArray.append(postalCode)
        }
        
        if dataArray.count > 0 {
            return dataArray.joined(separator: ", ")
        }
        return nil
    }
}
