//
//  CheckoutModel.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 05/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import Foundation

class CheckoutClass {
    var cartID: Int
    
    var productCheckoutImage: String?
    
    var productCheckoutName: String?
    
    var productCheckoutSize: String?
    
    var productCheckoutCode: String?
    
    var productCheckoutColor: String?
    
    var productCheckoutPrice: Int?
    
    var productCheckoutQuantity: Int?
    
    init(cartID: Int, productCheckoutImage: String, productCheckoutName: String, productCheckoutSize: String, productCheckoutCode: String, productCheckoutColor: String, productCheckoutPrice: Int, productCheckoutQuantity: String = "0") {
        self.cartID = cartID
        
        self.productCheckoutName = productCheckoutName
        
        self.productCheckoutSize = productCheckoutSize
        
        self.productCheckoutImage = productCheckoutImage
        
        self.productCheckoutPrice = productCheckoutPrice
        
        self.productCheckoutColor = productCheckoutColor
        
        self.productCheckoutImage = productCheckoutImage
        
        self.productCheckoutQuantity = Int(productCheckoutQuantity) ?? 0
        
        self.productCheckoutCode = productCheckoutCode
    }
}
