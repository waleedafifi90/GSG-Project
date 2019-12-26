//
//  Category.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 26/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import Foundation
import SDWebImage
import SwiftyJSON

class Category {
    
    var categoryID: Int?
    
    var categoryImage: String?
    
    var categoryName: String?
    
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        self.categoryID = json["id"].intValue
        
        self.categoryImage = json["s_image"].stringValue
        
        self.categoryName = json["s_name"].stringValue
    }
    
    init(categoryID: Int, categoryImage: String, categoryName: String) {
        self.categoryID = categoryID
        
        self.categoryName = categoryName
        
        self.categoryImage = categoryImage
    }
}
