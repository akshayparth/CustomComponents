//
//  LocationsDetectedDelegate.swift
// Copyright - Devarshi Kulshreshtha (devarshi.kulshreshtha@gmail.com)
//

import CoreLocation

protocol LocationsDetectedDelegate {
    func locationsDetected(placemarks: [CLPlacemark])
}
