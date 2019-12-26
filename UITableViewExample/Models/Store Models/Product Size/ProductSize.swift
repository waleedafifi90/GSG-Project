//
//  ProductSize.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 17/11/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import Foundation

class ProductSize {
    var product_id: Int?
    
    var s_name: String?
    
    init(product_id: Int, s_name: String) {
        self.product_id = product_id
        
        self.s_name = s_name
    }
}
