//
//  LocationDetectionManager.swift
//  LocationPicker
//

import UIKit
import CoreLocation

class LocationDetectionManager: NSObject {
    // MARK: Vars
    private var locationManager: CLLocationManager?
    private weak var presenter: LocationPermissionPresenterDelegate?
    var reverseGeocodeManager: ReverseGeocodeManager
    private var isLocationMonitoringOn = false
    
    init(presenter: LocationPermissionPresenterDelegate, reverseGeocodeManager: ReverseGeocodeManager) {
        self.presenter = presenter
        self.reverseGeocodeManager = reverseGeocodeManager
    }
    
    func detectCurrentLocation() {
        if locationManager == nil {
            locationManager = CLLocationManager()
            locationManager?.delegate = self
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        }
        authorize()
    }
    
    private func authorize() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse, .authorizedAlways:
            isLocationMonitoringOn = true
            locationManager?.startUpdatingLocation()
        case .notDetermined:
            locationManager?.requestWhenInUseAuthorization()
        case .restricted, .denied:
            presenter?.alertUserForLocationPermission()
        @unknown default:
            print("error in switch of authorization status")
        }
    }
}

extension LocationDetectionManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            isLocationMonitoringOn = true
            locationManager?.startUpdatingLocation()
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Added below flag because this delegate was being invoked again and again even stopUpdatingLocation was invoked
        guard isLocationMonitoringOn else {
            return
        }
        isLocationMonitoringOn = false
        locationManager?.stopUpdatingLocation()
        if let location = locations.last {
            reverseGeocodeManager.reverseGeocode(location: location)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
}
