//
//  Request.swift
//  Gmaps
//
//  Created by Damian Esteban on 7/5/15.
//  Copyright (c) 2015 Damian Esteban. All rights reserved.
//

//import Foundation
//import UIKit
//import CoreLocation
//
//class Request {
//    
//    let apiKEY = "YOUR_KEY_HERE"
//    var placesTask = NSURLSessionDataTask()
//    var session: NSURLSession {
//        return NSURLSession.sharedSession()
//    }
//    
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
//}
//
//
//
//
