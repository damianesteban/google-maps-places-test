//
//  Place.swift
//  Gmaps
//
//  Created by Damian Esteban on 7/6/15.
//  Copyright (c) 2015 Damian Esteban. All rights reserved.
//

import Foundation
import CoreLocation

class Place {
    var name: String
    var address: String
    var latitude: CLLocationDegrees
    var longitude: CLLocationDegrees
    var coordinate: CLLocationCoordinate2D
    
    init(name: String, address: String, latitude: CLLocationDegrees, longitude: CLLocationDegrees, coordinate: CLLocationCoordinate2D) {
        self.name = name
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
        self.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
    }
}