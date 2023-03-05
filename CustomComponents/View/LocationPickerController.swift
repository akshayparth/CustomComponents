//
//  LocationPickerController.swift
//  LocationPicker
//

import UIKit
import CoreLocation
import ViewHelper

public protocol LocationPickerControllerProvider {
    func provideLocationPickerController(with selectedLocationDelegate: SelectedLocationDelegate) -> LocationPickerController
}

public extension LocationPickerControllerProvider {
    func provideLocationPickerController(with selectedLocationDelegate: SelectedLocationDelegate) -> LocationPickerController {
        let bundle = Bundle(for: LocationPickerController.self)
        let storyboard = UIStoryboard(name: "LocationPicker", bundle: bundle)
        let locationPicker = storyboard.instantiateViewController(withIdentifier: String(describing: LocationPickerController.self))  as! LocationPickerController
        let locationPickerConfigurator = LocationPickerConfigurator(with: locationPicker)
        locationPickerConfigurator.configure(with: selectedLocationDelegate)
        return locationPicker
    }
}

public protocol LocationPickerControllerPresenter {
    func pushLocationPicker(with selectedLocationDelegate: SelectedLocationDelegate, provider: LocationPickerControllerProvider, animated: Bool, on navigationController: UINavigationController?)
}

public extension LocationPickerControllerPresenter {
    func pushLocationPicker(with selectedLocationDelegate: SelectedLocationDelegate, provider: LocationPickerControllerProvider, animated: Bool, on navigationController: UINavigationController?) {
        let locationPicker = provider.provideLocationPickerController(with: selectedLocationDelegate)
        navigationController?.pushViewController(locationPicker, animated: animated)
    }
}

public class LocationPickerController: UIViewController, LocationPermissionPresenterDelegate {
    // MARK: Outlets
    @IBOutlet weak var locationSearchBar: UISearchBar!
    @IBOutlet weak var detectCurrentLocationButton: UIButton!
    @IBOutlet weak var resultsTableView: UITableView!
    
    // MARK: Vars
    var locationDetectionManager: LocationDetectionManager!
    var geocodeManager: GeocodeManager!
    var selectedLocationDelegate: SelectedLocationDelegate!
    
    var identifiedPlacemarks = [CLPlacemark]() {
        didSet {
            resultsTableView.reloadData()
        }
    }
    
    // MARK: overriden functions
    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        resultsTableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    // MARK: IBActions
    @IBAction func detectCurrentLocation(_ sender: Any) {
        locationDetectionManager.detectCurrentLocation()
    }
}

// MARK: UITableViewDataSource implementation
extension LocationPickerController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return identifiedPlacemarks.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PlacemarkTableViewCell.self), for: indexPath) as! PlacemarkTableViewCell
        let placemark = identifiedPlacemarks[indexPath.row]
        cell.display(placemark: placemark)
        return cell
    }
}

// MARK: UITableViewDelegate implementation
extension LocationPickerController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row < identifiedPlacemarks.count else {
            return
        }
        selectedLocationDelegate.selected(location: identifiedPlacemarks[indexPath.row])
        _ = navigationController?.popViewController(animated: true)
    }
}

// MARK: ReverseGeocodeResultsHandlerDelegate implementation
extension LocationPickerController: ReverseGeocodeResultsHandlerDelegate {
    func onReverseGeocodeNoLocationsFound(dueTo error: Error) {
       display(error: error, with: NSLocalizedString("No Locations found!", comment: ""))
    }
    
    func onReverseGeocodeNoLocationsFound() {
        // Nothing to do as of now
        identifiedPlacemarks = [CLPlacemark]()
    }
    
    func onReverseGeocodeLocationsFound(placemarks: [CLPlacemark]) {
        // refresh table view
        identifiedPlacemarks = placemarks
    }
}

// MARK: UITextFieldDelegate implementation
extension LocationPickerController: UISearchBarDelegate {
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchedText = searchBar.text {
            geocodeManager.geocode(address: searchedText)
        }
    }
}

// MARK: GeocodeResultsHandlerDelegate implementation
extension LocationPickerController: GeocodeResultsHandlerDelegate {
    func onGeocodeNoLocationsFound(dueTo error: Error) {
        displayError(message: NSLocalizedString("No Locations Found", comment: ""), title: NSLocalizedString("Error!", comment: ""))
    }
    
    func onGeocodeNoLocationsFound() {
        // Nothing to do as of now
        identifiedPlacemarks = [CLPlacemark]()
    }
    
    func onGeocodeLocationsFound(placemarks: [CLPlacemark]) {
        // refresh table view
        identifiedPlacemarks = placemarks
    }
}
