//
//  LocationPickerConfigurator.swift
// Copyright - Devarshi Kulshreshtha (devarshi.kulshreshtha@gmail.com)
//
//  Performs dependency injection for LocationPickerController

import UIKit

public class LocationPickerConfigurator {
    private weak var locationPickerController: LocationPickerController!
    public init(with locationPickerController: LocationPickerController) {
        self.locationPickerController = locationPickerController
    }
    public func configure(with delegate: SelectedLocationDelegate) {
        let reverseGeocodeManager = ReverseGeocodeManager(with: locationPickerController)
        let locationDetectionManager = LocationDetectionManager(presenter: locationPickerController, reverseGeocodeManager: reverseGeocodeManager)
        let geocodeManager = GeocodeManager(with: locationPickerController)
        locationPickerController.geocodeManager = geocodeManager
        locationPickerController.locationDetectionManager = locationDetectionManager
        locationPickerController.selectedLocationDelegate = delegate
    }
}
