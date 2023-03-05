//
//  PlacemarkTableViewCell.swift
//  LocationPicker
//

import UIKit
import CoreLocation

class PlacemarkTableViewCell: UITableViewCell {
    func display(placemark: CLPlacemark) {
        if let address = placemark.address {
            textLabel?.text = address
        } else {
            textLabel?.text = NSLocalizedString("Address not found!", comment: "")
        }
    }
}
