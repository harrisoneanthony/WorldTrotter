//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Harrison Anthony on 6/15/23.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBAction func zoomInButtonTapped(_ sender: UIButton) {
        zoomIn()
    }

    @IBAction func zoomOutButtonTapped(_ sender: UIButton) {
        zoomOut()
    }


 
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view")
        
        locationManager.delegate = self
        
        // Request location authorization
        locationManager.requestWhenInUseAuthorization()
           
        // Start location updates
        locationManager.startUpdatingLocation()
        
        func myRegion() {
            
        }
        
        
    }
    
    func zoomIn() {
        var region = mapView.region
        region.span.latitudeDelta /= 2.0
        region.span.longitudeDelta /= 2.0
        mapView.setRegion(region, animated: true)
    }

    func zoomOut() {
        var region = mapView.region
        region.span.latitudeDelta *= 2.0
        region.span.longitudeDelta *= 2.0
        mapView.setRegion(region, animated: true)
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
            
            let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                    mapView.setRegion(coordinateRegion, animated: true)
        }
    }
    
    // Handle authorization status changes if needed
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        // Handle authorization changes here
    }
}

