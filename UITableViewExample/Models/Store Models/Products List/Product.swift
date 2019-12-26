//
//  Product.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 23/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import Foundation
import SwiftyJSON

class Product {
    
    var productID: Int?
    
    var productName: String?
    
    var productImage: String?
    
    var productRate: Double?
    
    var productDescription: String?
    
    var productPrice: Float?
    
    var productColor: Int?
    
    var isFav: Bool?
    
//    init(fromJson json: JSON!){
//        if json.isEmpty{
//            return
//        }
//        self.productID = json["id"].intValue
//        
//        self.productName = json["s_name"].stringValue
//        
//        self.productImage = json["s_featured_image"].stringValue
//        
//        self.productRate = json["body"].doubleValue
//        
//        self.productDescription = json["s_description"].stringValue
//        
//        self.productPrice = json["d_price"].floatValue
//        
//        self.isFav = json["body"].boolValue
//        
//        self.productColor = json["body"].intValue
//
//    }
    
    init(productID: Int, productName: String, productImage: String, productRate: Double, productDescription: String, productPrice: Float, isFav: Bool = false, productColor: Int = 1) {
        self.productID = productID

        self.productName = productName

        self.productImage = productImage

        self.productRate = productRate

        self.productDescription = productDescription

        self.productPrice = productPrice

        self.isFav = isFav

        self.productColor = productColor
    }
}
