//
//  ViewController.swift
//  Gmaps
//
//  Created by Damian Esteban on 7/4/15.
//  Copyright (c) 2015 Damian Esteban. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let gpaViewController = GooglePlacesAutocomplete(
        apiKey: "AIzaSyA8Csg82zsqa6msI0czCz8FjiXemYFaZFw",
        placeType: .Establishment
    )
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        gpaViewController.placeDelegate = self
        
        presentViewController(gpaViewController, animated: true, completion: nil)
    }
}

extension ViewController: GooglePlacesAutocompleteDelegate {
    func placeSelected(place: Place) {
        println(place.description)
        
        place.getDetails { details in
            println(details)
        }
    }
    
    func placeViewClosed() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}