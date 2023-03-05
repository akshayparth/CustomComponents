//
//  SelectedLocationDelegate.swift
// Copyright - Devarshi Kulshreshtha (devarshi.kulshreshtha@gmail.com)
//

import CoreLocation

public protocol SelectedLocationDelegate {
    func selected(location: CLPlacemark)
}
