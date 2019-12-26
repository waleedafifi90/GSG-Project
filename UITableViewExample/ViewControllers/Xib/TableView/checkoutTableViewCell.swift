//
//  checkoutTableViewCell.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 06/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit

class checkoutTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productCheckoutImage: UIImageView!
    
    @IBOutlet weak var productCheckoutQuantity: UITextField!
    
    @IBOutlet weak var productCheckoutName: UILabel!
    
    @IBOutlet weak var productCheckoutSize: UILabel!
    
    @IBOutlet weak var productCheckoutColor: UILabel!
    
    @IBOutlet weak var productCheckoutCode: UILabel!
    
    @IBOutlet weak var productCheckoutPrice: UILabel!
    
    @IBOutlet weak var productCheckoutSubtotal: UILabel!
    
    var object: CheckoutClass?
    
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func btnAddQuantity(_ sender: Any) {
        productCheckoutQuantity.text = String((Int(productCheckoutQuantity.text ?? "0") ?? 0) + 1)
        if let parent = self.parentViewController as? checkoutViewController {
            var newValue: Int = 0
            let totalSection = parent.tableView.numberOfSections
            for section in 0..<totalSection
            {
                let totalRows = parent.tableView.numberOfRows(inSection: section)
                for row in 0..<totalRows
                {
                    let cell = parent.tableView.cellForRow(at: IndexPath(row: row, section: section)) as! checkoutTableViewCell
                    let txt1: Int = (Int(cell.productCheckoutPrice.text ?? "0") ?? 0) * (Int(cell.productCheckoutQuantity.text ?? "0") ?? 0)
                    newValue += txt1
                    self.productCheckoutSubtotal.text = String(txt1)
                    editCart(cartID: parent.objects[indexPath?.row ?? 0].cartID , quantity: (Int(cell.productCheckoutQuantity.text ?? "0") ?? 0))
                }
            }
            print(newValue)
            parent.totalPrice = newValue
            parent.lblSubTotal.text = String(newValue)
            parent.lblTotal.text = String(newValue + (parent.tax ?? 0))
            
            
            
        }
        
    }
    
    @IBAction func btnRemoveQuantity(_ sender: Any) {
        if Int(productCheckoutQuantity.text ?? "0") ?? 0 > 0 {
            productCheckoutQuantity.text = String((Int(productCheckoutQuantity.text ?? "0") ?? 0) - 1)
            if let parent = self.parentViewController as? checkoutViewController {
                var newValue: Int = 0
                let totalSection = parent.tableView.numberOfSections
                for section in 0..<totalSection
                {
                    let totalRows = parent.tableView.numberOfRows(inSection: section)
                    for row in 0..<totalRows
                    {
                        let cell = parent.tableView.cellForRow(at: IndexPath(row: row, section: section)) as! checkoutTableViewCell
                        let txt1: Int = (Int(cell.productCheckoutPrice.text ?? "0") ?? 0) * (Int(cell.productCheckoutQuantity.text ?? "0") ?? 0)
                        newValue += txt1
                        self.productCheckoutSubtotal.text = String(txt1)
                        editCart(cartID: parent.objects[indexPath?.row ?? 0].cartID , quantity: Int(cell.productCheckoutQuantity?.text ?? "0") ?? 0)
                        
                    }
                }
                print(newValue)
                parent.totalPrice = newValue
                parent.lblSubTotal.text = String(newValue)
                parent.lblTotal.text = String(newValue + (parent.tax ?? 0))
            }
        }
    }
    
    @IBAction func btnRemoveItem(_ sender: Any) {
        if let parent = self.parentViewController as? checkoutViewController {
            parent.showAlertPopUp(title: "Delete Confermation!!", message: "Are you sure?", buttonAction1: {
                var newValue: Int = 0
                let totalSection = parent.tableView.numberOfSections
                for section in 0..<totalSection
                {
                    let totalRows = parent.tableView.numberOfRows(inSection: section)
                    for row in 0..<totalRows
                    {
                        let cell = parent.tableView.cellForRow(at: IndexPath(row: row, section: section)) as! checkoutTableViewCell
                        let txt1: Int = (Int(cell.productCheckoutPrice.text ?? "0") ?? 0) * (Int(cell.productCheckoutQuantity.text ?? "0") ?? 0)
                        newValue += txt1
                        self.productCheckoutSubtotal.text = String(txt1)
                    }
                }
                if UserProfile.shared.userID != nil {
                    let request = BaseRequest()
                    let urlExt = "public/api"
                    request.url = "\(urlExt)/cart/\(parent.objects[self.indexPath?.row ?? 0].cartID)"
                    request.method = .delete
                    RequestBuilder.requestWithSuccessFullResponse(request: request, showLoader: true, showErrorMessage: true) { (json) in

                    }
                }
                parent.totalPrice = newValue
                parent.lblSubTotal.text = String(newValue)
                parent.lblTotal.text = String(newValue + (parent.tax ?? 0))
                
                parent.tableView.beginUpdates()
                parent.tableView.deleteRows(at: [(self.indexPath!)], with: .left)
                parent.objects.remove(at: self.indexPath?.row ?? 0)
                parent.tableView.endUpdates()
            }) {
                
            }
        }
    }
    
    func configureCheckout() {
        self.productCheckoutName.text = object?.productCheckoutName
        
        self.productCheckoutSize.text = object?.productCheckoutSize
        
        self.productCheckoutPrice.text = String((object?.productCheckoutPrice) ?? 0)
        
        self.productCheckoutColor.backgroundColor = object?.productCheckoutColor?.color_
        
        self.productCheckoutCode.text = object?.productCheckoutCode
        
        self.productCheckoutQuantity.text = String(object?.productCheckoutQuantity ?? 0)
        
        self.productCheckoutSubtotal.text = String((object?.productCheckoutQuantity ?? 0) * (object?.productCheckoutPrice ?? 0))
        
    }
    
    func editCart(cartID: Int, quantity: Int) {
        if UserProfile.shared.userID != nil {
            let request = BaseRequest()
            let urlExt = "public/api"
            request.url = "\(urlExt)/cart/\(cartID)"
            request.method = .patch
            request.parameters = [
                "quantity": quantity
            ]
            RequestBuilder.requestWithSuccessFullResponse(request: request, showLoader: true, showErrorMessage: true) { (json) in
                debugPrint(json)
            }
        }
    }
}
