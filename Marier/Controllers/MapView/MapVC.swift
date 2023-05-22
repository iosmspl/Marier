//
//  MapVC.swift
//  Marier
//
//  Created by MacBook M1 on 18/05/23.
//

import UIKit
import CoreLocation
import MapKit
class MapVC: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        mapView.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.MarkerOnMap(_:)))
        
        // Request location authorization
        locationManager.requestWhenInUseAuthorization()
        
        // Check if location services are enabled
        if CLLocationManager.locationServicesEnabled(){
           checkLoctionAuthorization()
        }
        
        // Enable user interaction for the map view
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.showsUserLocation = true
    }
   @objc func MarkerOnMap(_ uitapGesture : UITapGestureRecognizer){
        let locationInView = uitapGesture.location(in: mapView)
        let locationOnMap = mapView.convert(locationInView, toCoordinateFrom: mapView)
        
        let annotaion = MKPointAnnotation()
        annotaion.coordinate = locationOnMap
        mapView.addAnnotation(annotaion)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let mk = MKMarkerAnnotationView()
        return mk
    }
    
    
    
    func checkLoctionAuthorization(){
        let authStatus = locationManager.authorizationStatus
        
        switch authStatus{
            
        case .notDetermined:
            print("")
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            print("")
        case .authorizedAlways , .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        
        @unknown default:
            print("")
        }
    }
    
    
    @IBAction func BackTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            // Center the map on the user's current location
            let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
            mapView.setRegion(region, animated: true)
            
            // Stop updating location to save battery
            locationManager.stopUpdatingLocation()
        }
    }
    // MARK: -
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLoctionAuthorization()
    }
    
    
    
    // MARK: - MKMapViewDelegate
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        // Handle annotation selection
        guard let annotation = view.annotation as? MKPointAnnotation else {
                    return
                }
                
                let selectedLocation = annotation.coordinate
                let latitude = selectedLocation.latitude
                let longitude = selectedLocation.longitude
                
                // Use the latitude and longitude values as needed
                print("Selected location: Latitude - \(latitude), Longitude - \(longitude)")
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
