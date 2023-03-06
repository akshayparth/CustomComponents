//
//  ReverseGeocodeResultsHandlerDelegate.swift
// Copyright - Devarshi Kulshreshtha (devarshi.kulshreshtha@gmail.com)
//

import Foundation
import CoreLocation

protocol ReverseGeocodeResultsHandlerDelegate: AnyObject {
    func onReverseGeocodeNoLocationsFound(dueTo error: Error)
    func onReverseGeocodeNoLocationsFound()
    func onReverseGeocodeLocationsFound(placemarks: [CLPlacemark])
}
