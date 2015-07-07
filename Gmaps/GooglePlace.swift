//
//  Place.swift
//  Gmaps
//
//  Created by Damian Esteban on 7/4/15.
//  Copyright (c) 2015 Damian Esteban. All rights reserved.
//

//import UIKit
//import Foundation
//import CoreLocation
//
//class GooglePlace {
//    
//    let name: String
//    let formatted_address: String
//    let coordinate: CLLocationCoordinate2D
//    var iconURL: String?
//    
//    init(dictionary:NSDictionary, acceptedTypes: [String])
//    {
//        name = dictionary["name"] as! String
//        formatted_address = dictionary["formatted_address"] as! String
//        
//        let location = dictionary["geometry"]?["location"] as! NSDictionary
//        let lat = location["lat"] as! CLLocationDegrees
//        let lng = location["lng"] as! CLLocationDegrees
//        coordinate = CLLocationCoordinate2DMake(lat, lng)
//        
//        iconURL = dictionary["icon"] as? String
//        
//    }
//}
//
//
////
////    class func makeEndPoint(location: CLLocationCoordinate2D, radius: String, types: String, key: String) {
////        var endpoint = NSURL(string: "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(location)&radius=\(radius)&types=\(types)&key=\(key)")
////        
////        data = NSData(contentsOfURL: endpoint!)
////    }
////    
////    class func deserializeObject(data: NSData) {
////        if let json: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: nil) as? NSDictionary {
////            
////            if let items = json["items"] as? NSArray {
////                for item in items {
////                    self.location = item["formatted_address"]
////                    
////                }
////            }
////        }
////    }
////}
//
//    
//    
//
