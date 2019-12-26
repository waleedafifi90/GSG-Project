//
//  checkoutCollectionViewCell.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 05/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit

class checkoutCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productCheckoutImage: UIImageView!
    
    @IBOutlet weak var productCheckoutQuantity: UITextField!
    
    @IBOutlet weak var productCheckoutName: UILabel!
    
    @IBOutlet weak var productCheckoutSize: UILabel!
    
    @IBOutlet weak var productCheckoutColor: UILabel!
    
    @IBOutlet weak var productCheckoutCode: UILabel!
    
    @IBOutlet weak var productCheckoutPrice: UILabel!
    
    @IBOutlet weak var productCheckoutSubtotal: UILabel!
    
    var object: CheckoutClass?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func btnAddQuantity(_ sender: Any) {
        productCheckoutQuantity.text = String((Int(productCheckoutQuantity.text ?? "0") ?? 0) + 1)
    }
    
    @IBAction func btnRemoveQuantity(_ sender: Any) {
        if Int(productCheckoutQuantity.text ?? "0") ?? 0 > 0 {
            productCheckoutQuantity.text = String((Int(productCheckoutQuantity.text ?? "0") ?? 0) - 1)
        }
    }
    
    @IBAction func btnRemoveItem(_ sender: Any) {
    }
    
    func configureCheckout() {
        self.productCheckoutName.text = object?.productCheckoutName
        
        self.productCheckoutSize.text = object?.productCheckoutSize
        
        self.productCheckoutColor.backgroundColor = object?.productCheckoutColor?.color_
    }
    
    
}
