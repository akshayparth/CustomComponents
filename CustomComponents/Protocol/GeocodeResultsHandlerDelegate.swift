//
//  GeocodeResultsHandlerDelegate.swift
// Copyright - Devarshi Kulshreshtha (devarshi.kulshreshtha@gmail.com)
//

import Foundation
import CoreLocation

protocol GeocodeResultsHandlerDelegate: class {
    func onGeocodeNoLocationsFound(dueTo error: Error)
    func onGeocodeNoLocationsFound()
    func onGeocodeLocationsFound(placemarks: [CLPlacemark])
}
