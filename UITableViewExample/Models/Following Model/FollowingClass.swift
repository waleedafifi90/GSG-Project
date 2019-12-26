//
//  FollowingClass.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 22/09/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import Foundation

class FollowingClass {
    
    var name: String?
    
    var followingRate: String?
    
    var image: String?
    
    init(name: String, followingRate: String, image: String) {
        self.name = name
        
        self.followingRate = followingRate
        
        self.image = image
    }
}
