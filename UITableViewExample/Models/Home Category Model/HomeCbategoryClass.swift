//
//  HomeCategoryModel.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 01/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import Foundation

class HomeCategoryClass {
    var id: Int?
    
    var cellTitle: String?
    
    var cellIcon: String?
        
    init(id: Int, cellTitle: String, cellIcon: String) {
        self.id = id
        
        self.cellTitle = cellTitle
        
        self.cellIcon = cellIcon
        
    }
}
