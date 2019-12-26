//
//  ProductImages.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 15/11/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import Foundation

class ProductImages {
    var product_id: Int?
    
    var s_alt: String?
    
    var s_image: String?
    
    var i_status: Int?
    
    init(product_id: Int, s_alt: String, s_image: String, i_status: Int) {
        self.product_id = product_id
        
        self.i_status = i_status
        
        self.s_alt = s_alt
        
        self.s_image = s_image
    }
}
