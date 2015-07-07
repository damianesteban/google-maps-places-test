//
//  TestViewController.swift
//  Gmaps
//
//  Created by Damian Esteban on 7/6/15.
//  Copyright (c) 2015 Damian Esteban. All rights reserved.
//

import UIKit
import SwiftyJSON

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var urlString = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=bars&location=40.7275043,-73.9800645&radius=200&key=AIzaSyA8Csg82zsqa6msI0czCz8FjiXemYFaZFw"
        
        if let url = NSURL(string: urlString) {
            if let data = NSData(contentsOfURL: url, options: .allZeros, error: nil) {
                let json = JSON(data: data)
                parseJSON(json)
                println(venueObjects)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var places = [Place]()
    var venueObjects = [[String: String]]()
    
    func parseJSON(json: JSON) {
        for result in json["results"].arrayValue {
            let address = result["formatted_address"].stringValue
            let latitude = result["geometry"]["location"]["lat"].stringValue
            let longitude = result["geometry"]["location"]["lng"].stringValue
            let icon = result["icon"].stringValue
            let name = result["name"].stringValue
            let jsonObject = ["address": address, "latitude": latitude, "longitude": longitude, "icon": icon, "name": name]
            venueObjects.append(jsonObject)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
