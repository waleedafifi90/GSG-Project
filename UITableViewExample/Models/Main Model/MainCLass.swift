//
//  MainCLass.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 19/09/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import Foundation

class MainClass {
    var image: String?
    
    var gradiant: String?
    
    var cellTitle: String?
    
    init(image: String, gradiant: String, cellTitle: String) {
        self.image = image
        
        self.gradiant = gradiant
        
        self.cellTitle = cellTitle
    }
}
