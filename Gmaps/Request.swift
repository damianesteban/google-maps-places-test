//
//  Request.swift
//  Gmaps
//
//  Created by Damian Esteban on 7/5/15.
//  Copyright (c) 2015 Damian Esteban. All rights reserved.
//
//
//import Foundation
//import UIKit
//import CoreLocation
//import SwiftyJSON
//
//class Request {
//    
//    var placesArray = [Place]()
//    
//    func requestPlacesNearCoordinate(coordinate: CLLocationCoordinate2D, radius: Double) -> [Place] {
//        var urlString = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=bars&location=\(coordinate.latitude),\(coordinate.longitude)&radius=\(radius)&key=AIzaSyA8Csg82zsqa6msI0czCz8FjiXemYFaZFw"
//    
//        if let url = NSURL(string: urlString) {
//            if let data = NSData(contentsOfURL: url, options: .allZeros, error: nil) {
//                let json = JSON(data: data)
//                parseJSON(json)
//                }
//        }
//        return placesArray
//    }
//
//
//    func parseJSON(json: JSON) -> [Place] {
//        var placesArray = [Place]()
//        for result in json["results"].arrayValue {
//            let name = result["name"].stringValue
//            let address = result["formatted_address"].stringValue
//            let latitude = result["geometry"]["location"]["lat"].doubleValue
//            let longitude = result["geometry"]["location"]["lng"].doubleValue
//            let coordinate = CLLocationCoordinate2DMake(latitude, longitude)
//            let place = Place(name: name, address: address, latitude: latitude, longitude: longitude, coordinate: coordinate)
//            placesArray.append(place)
//        }
//        return placesArray
//    }
//}

//    func requestPlaces(query: String, coordinate: CLLocationCoordinate2D, radius: Double, types: [String], completion: (([GooglePlace]) -> Void)) -> () {
//        var urlString = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=\(query)=\(coordinate.latitude),\(coordinate.longitude)&radius=200&key=\(apiKEY)"
//        
//        urlString = urlString.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
//        
//        if placesTask.taskIdentifier > 0 && placesTask.state == .Running {
//            placesTask.cancel()
//        }
//        
//        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
//        placesTask = session.dataTaskWithURL(NSURL(string: urlString)!) { data, response, error in
//            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
//            var placesArray = [GooglePlace]()
//            
//            if let json = NSJSONSerialization.JSONObjectWithData(data, options:nil, error:nil) as? NSDictionary {
//                if let results = json["results"] as? NSArray {
//                    for rawPlace:AnyObject in results {
//                        println(results)
//                        let place = GooglePlace(dictionary: rawPlace as! NSDictionary, acceptedTypes: types)
//                        
//                        placesArray.append(place)
//                    }
//                }
//            }
//            dispatch_async(dispatch_get_main_queue()) {
//                completion(placesArray)
//            }
//        }
//        placesTask.resume()
//        
//    }





