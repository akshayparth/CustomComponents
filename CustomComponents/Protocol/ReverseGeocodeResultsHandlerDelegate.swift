//
//  ReverseGeocodeResultsHandlerDelegate.swift
// Copyright - Devarshi Kulshreshtha (devarshi.kulshreshtha@gmail.com)
//

import Foundation
import CoreLocation

protocol ReverseGeocodeResultsHandlerDelegate: class {
    func onReverseGeocodeNoLocationsFound(dueTo error: Error)
    func onReverseGeocodeNoLocationsFound()
    func onReverseGeocodeLocationsFound(placemarks: [CLPlacemark])
}
