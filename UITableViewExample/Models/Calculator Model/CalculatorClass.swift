//
//  CalculatorModel.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 22/09/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import Foundation

class CalculatorClass {
    var itemName: String?
    
    var itemPrice: Int?
    
    var itemTag: Int?
        
    init(itemName: String, itemPrice: Int, itemTag: Int = 0) {
        self.itemName = itemName
        
        self.itemPrice = itemPrice
        
        self.itemTag = itemTag
    }
}
