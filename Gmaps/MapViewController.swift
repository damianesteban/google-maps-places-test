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

class MapViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var mapCenterPinImage: UIImageView!
    
    @IBOutlet weak var pinImageVerticalConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let locationManager = CLLocationManager()
    var didFindMyLocation = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        mapView.addObserver(self, forKeyPath: "myLocation", options: NSKeyValueObservingOptions.New, context: nil)


    }
    
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        if !didFindMyLocation {
            let myLocation: CLLocation = change[NSKeyValueChangeNewKey] as! CLLocation
            mapView.camera = GMSCameraPosition.cameraWithTarget(myLocation.coordinate, zoom: 10.0)
            mapView.settings.myLocationButton = true
            
            didFindMyLocation = true
        }
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.AuthorizedAlways {
            mapView.myLocationEnabled = true
        }
    }
    

}
