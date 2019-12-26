//
//  ProductReview.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 15/11/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import Foundation

class ProductReview {
    var image: String?
    
    var name: String?
    
    var i_rate: Double?

    var s_review: String?
    
    init(image: String, name: String, rate: Double, reviewText: String) {
        self.image = image
        
        self.name = name
        
        self.i_rate = rate
        
        self.s_review = reviewText
    }
}
