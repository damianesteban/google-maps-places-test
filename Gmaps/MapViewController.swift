//
//  MapViewController.swift
//  Gmaps
//
//  Created by Damian Esteban on 7/3/15.
//  Copyright (c) 2015 Damian Esteban. All rights reserved.
//

//import UIKit
//import GoogleMaps
//import CoreLocation
//
//
//class MapViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {
//    
//    @IBOutlet weak var mapView: GMSMapView!
//    @IBOutlet weak var searchBar: UISearchBar!
//
//    @IBOutlet weak var addressLabel: UILabel!
//    
//    let locationManager = CLLocationManager()
//    
//    let request = Request()
//    
//    var searchedTypes = [String]()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        mapView.delegate = self
//        locationManager.delegate = self
//        locationManager.requestAlwaysAuthorization()
//    }
//    
//    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
//            locationManager.startUpdatingLocation()
//            
//            mapView.myLocationEnabled = true
//            mapView.settings.myLocationButton = true
//            mapView.settings.compassButton = true
//    }
//    
//    func reverseGeocodeCoordinate(coordinate: CLLocationCoordinate2D) {
//        let geocoder = GMSGeocoder()
//        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
//            if let address = response?.firstResult() {
//                let lines = address.lines as! [String]
//                self.addressLabel.text = join("\n", lines)
//                
//                UIView.animateWithDuration(0.25) {
//                    self.view.layoutIfNeeded()
//                }
//            }
//        }
//        
//    }
//    
//    func mapView(mapView: GMSMapView!, idleAtCameraPosition position: GMSCameraPosition!) {
//        reverseGeocodeCoordinate(position.target)
//    }
//    
//    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
//        if let location = locations.first as? CLLocation {
//            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
//            
//            locationManager.stopUpdatingLocation()
//            requestPlaces(location.coordinate)
//        }
//    }
//    
//    var mapRadius: Double {
//        get {
//            let region = mapView.projection.visibleRegion()
//            let verticalDistance = GMSGeometryDistance(region.farLeft, region.nearLeft)
//            let horizontalDistance = GMSGeometryDistance(region.farLeft, region.farRight)
//            return max(horizontalDistance, verticalDistance)*0.5
//        }
//    }
//    
//    func requestPlaces(coordinate: CLLocationCoordinate2D) {
//        mapView.clear()
//        
//        request.requestPlaces("bars", coordinate: coordinate, radius: mapRadius, types: searchedTypes) { places in
//            for place: GooglePlace in places {
//                let marker = PlacePin(place: place)
//                marker.map = self.mapView
//            }
//    }
//
//    
//    }
//}