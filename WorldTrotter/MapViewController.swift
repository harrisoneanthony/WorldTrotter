//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Harrison Anthony on 6/15/23.
//

import UIKit
import CoreLocation

class MapViewController: UIViewController {
 
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view")
        
        locationManager.delegate = self
        
        // Request location authorization
        locationManager.requestWhenInUseAuthorization()
           
        // Start location updates
        locationManager.startUpdatingLocation()
        
        
    }
}

extension MapViewController: CLLocationManagerDelegate {
    // Implement the necessary delegate methods
    // For example, you can handle location updates with the following method:
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Process the received locations
        if let location = locations.last {
            // Access the latitude and longitude from the location object
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            
            // Do something with the latitude and longitude values
            print("Latitude: \(latitude), Longitude: \(longitude)")
        }
    }
    
    // Handle authorization status changes if needed
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        // Handle authorization changes here
    }
}

