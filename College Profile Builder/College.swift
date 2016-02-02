//
//  College.swift
//  College Profile Builder
//
//  Created by Maddy Sutton on 1/21/16.
//  Copyright © 2016 Maddy Sutton. All rights reserved.
//

import UIKit

class College: NSObject {

    var name = ""
    var location = ""
    var numberOfStudents = 0
    var image = UIImage(named: "Default")
    var website = ""
    
    convenience init(name: String, location: String, numberOfStudents: Int, image: UIImage, website: String){
        self.init()
        self.name = name
        self.location = location
        self.numberOfStudents = numberOfStudents
        self.image = image
        self.website = website
    
    }
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}
