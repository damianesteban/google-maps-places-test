//
//  MapViewController.swift
//  Gmaps
//
//  Created by Damian Esteban on 7/3/15.
//  Copyright (c) 2015 Damian Esteban. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation
import SwiftyJSON

class MapViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var searchBar: UISearchBar!

    @IBOutlet weak var addressLabel: UILabel!
    
    @IBAction func refreshPlaces(sender: AnyObject) {
        requestPlaces(mapView.camera.target)
    }
    let locationManager = CLLocationManager()
//    let request = Request()
    
    var placesArray = [Place]()
    
//    var placeMarker: GMSMarker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
            locationManager.startUpdatingLocation()
            
            mapView.myLocationEnabled = true
            mapView.settings.myLocationButton = true
            mapView.settings.compassButton = true
    }
    
    func reverseGeocodeCoordinate(coordinate: CLLocationCoordinate2D) {
        let geocoder = GMSGeocoder()
        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
            if let address = response?.firstResult() {
                let lines = address.lines as! [String]
                self.addressLabel.text = join("\n", lines)
                
                UIView.animateWithDuration(0.25) {
                    self.view.layoutIfNeeded()
                }
            }
        }
        
    }
    
    func mapView(mapView: GMSMapView!, idleAtCameraPosition position: GMSCameraPosition!) {
        reverseGeocodeCoordinate(position.target)
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        if let location = locations.first as? CLLocation {
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            
            locationManager.stopUpdatingLocation()
            requestPlaces(location.coordinate)
        }
    }
    
    var mapRadius: Double {
        get {
            let region = mapView.projection.visibleRegion()
            let verticalDistance = GMSGeometryDistance(region.farLeft, region.nearLeft)
            let horizontalDistance = GMSGeometryDistance(region.farLeft, region.farRight)
            return max(horizontalDistance, verticalDistance)*0.5
        }
    }

    func requestPlaces(coordinate: CLLocationCoordinate2D) {
        mapView.clear()
        requestPlacesNearCoordinate(coordinate, radius: mapRadius)
        }
    
    func requestPlacesNearCoordinate(coordinate: CLLocationCoordinate2D, radius: Double) {
        var urlString = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=bars&location=\(coordinate.latitude),\(coordinate.longitude)&radius=\(radius)&key=AIzaSyA8Csg82zsqa6msI0czCz8FjiXemYFaZFw"
        
        if let url = NSURL(string: urlString) {
            if let data = NSData(contentsOfURL: url, options: .allZeros, error: nil) {
                let json = JSON(data: data)
                parseJSON(json)
            }
        }
    }
    
    
    func parseJSON(json: JSON){
        var placesArray = [Place]()
        for result in json["results"].arrayValue {
            let name = result["name"].stringValue
            let address = result["formatted_address"].stringValue
            let latitude = result["geometry"]["location"]["lat"].doubleValue
            let longitude = result["geometry"]["location"]["lng"].doubleValue
            let coordinate = CLLocationCoordinate2DMake(latitude, longitude)
            let place = Place(name: name, address: address, latitude: latitude, longitude: longitude, coordinate: coordinate)
            placesArray.append(place)
        }
        
        
        for place in placesArray {
            println(place.name)
            println(place.address)
            var placeMarker = GMSMarker()
            placeMarker.position = place.coordinate
            placeMarker.title = place.name
            placeMarker.map = mapView
            
        }
    }

    }
