//
//  ProductColor.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 15/11/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import Foundation

class ProductColor {
    var colorID: Int?
    
    var colorName: String?
    
    var colorHex: String?
    
    init(colorID: Int, colorName: String, colorHex: String) {
        self.colorID = colorID
        
        self.colorHex = colorHex
        
        self.colorName = colorName
    }
}
