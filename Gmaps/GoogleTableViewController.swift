////
////  GoogleTableViewController.swift
////  Gmaps
////
////  Created by Damian Esteban on 7/4/15.
////  Copyright (c) 2015 Damian Esteban. All rights reserved.
////
//
//import UIKit
//
//class GoogleTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//
//    @IBOutlet var tableView: UITableView!
//    
//    @IBOutlet weak var nameLabel: UILabel!
//    
//    @IBOutlet weak var addressLabel: UILabel!
//    
//    let cell = "placeCell"
//
//    var repositories = [Repository]()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.delegate = self
//        tableView.dataSource = self
//        
//        let type = "bar"
//        let key = "AIzaSyA8Csg82zsqa6msI0czCz8FjiXemYFaZFw"
//    
//        let placesURL = NSURL(string: "https://maps.googleapis.com/maps/api/place/textsearch/json?query=bars+in+midtown&location=40.7275043,-73.9800645&radius=200&key=AIzaSyA8Csg82zsqa6msI0czCz8FjiXemYFaZFw")
//        
//        if let JSONData = NSData(contentsOfURL: placesURL!) {
//        
//        if let json = NSJSONSerialization.JSONObjectWithData(JSONData, options: nil, error: nil) as? NSDictionary {
//            
//            if let reposArray = json["results"] as? [NSDictionary]  {
//                for item in reposArray {
//                    repositories.append(Repository(json: item))
//                }
//                
//            }
//        }
//        }
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return repositories.count
//    }
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "placeCell")
//        
//        cell.textLabel!.text = repositories[indexPath.row].name
//        cell.detailTextLabel!.text = repositories[indexPath.row].formatted_address
//    
//        
//        return cell
//    }
//    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        tableView.deselectRowAtIndexPath(indexPath, animated: true)
//        let row = indexPath.row
//
//    }
//    
//    
//    
//}
