//
//  Request.swift
//  Gmaps
//
//  Created by Damian Esteban on 7/5/15.
//  Copyright (c) 2015 Damian Esteban. All rights reserved.
//

import Foundation
import UIKit

class Repository {
    
    var name: String?
    var address: String?

    init(json: NSDictionary) {
        self.name = json["name"] as? String
        self.address = json["vicinity"] as? String
    }
}
