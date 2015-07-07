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
    var formatted_address: String
    var geometry: String
    var icon: String
    var name: String
    
    init(json: NSDictionary) {
        self.formatted_address = json["formatted_address"] as! String
        self.geometry = json["geometry"] as! String
        self.icon = json["icon"] as! String
        self.name = json["name"] as! String
    }
}