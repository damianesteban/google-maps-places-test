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

    
    var mapRadius: Double {
        get {
            let region = mapView.projection.visibleRegion()
            let verticalDistance = GMSGeometryDistance(region.farLeft, region.nearLeft)
            let horizontalDistance = GMSGeometryDistance(region.farLeft, region.farRight)
            return max(horizontalDistance, verticalDistance)*0.5
        }
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        var camera = GMSCameraPosition.cameraWithLatitude(1.285, longitude: 103.848, zoom: 12)
//        var mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
//        self.view = mapView
//        mapView.delegate = self
//        locationManager.delegate = self
//        locationManager.requestAlwaysAuthorization()
//        mapView.settings.myLocationButton = true
//        // The myLocation attribute of the mapView may be null
//        mapView!.myLocationEnabled = true
//        mapView!.settings.myLocationButton = true
//        if let mylocation = mapView.myLocation {
//            NSLog("User's location: %@", mylocation)
//        } else {
//            NSLog("User's location is unknown")
//        }
//    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()

    }

    




        // Do any additional setup after loading the view.

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(mapView: GMSMapView!, willMove gesture: Bool) {
        mapView.clear()
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        // 2
        if status == CLAuthorizationStatus.AuthorizedWhenInUse || status == CLAuthorizationStatus.AuthorizedAlways {
            
            // 3
            locationManager.startUpdatingLocation()
            
            //4
            mapView.myLocationEnabled = true
            mapView.settings.myLocationButton = true
        }
    }
    
//    func mapView(mapView: GMSMapView!, didTapMarker marker: GMSMarker!) -> Bool {
//        mapCenterPinImage.fadeOut(0.25)
//        return false
//    }
//    
//    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
//        if let location = locations.first as? CLLocation {
//            // 6
//            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
//            
//            // 7
//            locationManager.stopUpdatingLocation()
//        }
//    }
//
//    func didTapMyLocationButtonForMapView(mapView: GMSMapView!) -> Bool {
//        mapCenterPinImage.fadeIn(0.25)
//        mapView.selectedMarker = nil
//        return false
//    }
//
//    func mapView(mapView: GMSMapView!, idleAtCameraPosition position: GMSCameraPosition!) {
//        reverseGeocodeCoordinate(position.target)
//    }
//    
//    func reverseGeocodeCoordinate(coordinate: CLLocationCoordinate2D) {
//        let geocoder = GMSGeocoder()
//        geocoder.reverseGeocodeCoordinate(coordinate) { response , error in
//            UIView.animateWithDuration(0.25) {
//                self.view.layoutIfNeeded()
//                }
//            }
//        }


    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        mapView.delegate = self
    }


//    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
//        // 2
//    
//            
//            // 3
//            locationManager.startUpdatingLocation()
//            
//            //4
//            mapView!.myLocationEnabled = true
//            mapView!.settings.myLocationButton = true
//        }
//    }

    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
