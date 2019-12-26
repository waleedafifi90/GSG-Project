//
//  calculatorTableViewCell.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 22/09/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit

class calculatorTableViewCell: UITableViewCell {

    @IBOutlet weak var itemNameUILabel: UILabel!
    
    @IBOutlet weak var itemPriceUITextField: UITextField!
    
    @IBOutlet weak var btnDelete: UIButton!
    
    var cartObjects: CalculatorClass?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func calculatorConfigure() {
        itemNameUILabel.text = cartObjects?.itemName
        itemPriceUITextField.text = String(cartObjects?.itemPrice ?? 0)
    }

    @IBAction func btnDelete(_ sender: UIButton) {
        if let parent = self.parentViewController as? calculatorViewController {
            parent.showAlertPopUp(title: "Delete Confermation!!", message: "Are you sure?", buttonAction1: {
                let buttonPostion = sender.convert(sender.bounds.origin, to: parent.cartUITableView)
                if let indexPath = parent.cartUITableView.indexPathForRow(at: buttonPostion) {
                    parent.objects.remove(at: indexPath.row)
                    parent.cartUITableView.beginUpdates()
                    parent.cartUITableView.deleteRows(at: [indexPath], with: .left)
                    parent.cartUITableView.endUpdates()
                    let totalSection = parent.cartUITableView.numberOfSections
                    parent.oldText = 0
                    for section in 0..<totalSection {
                        let totalRows = parent.cartUITableView.numberOfRows(inSection: section)
                        for row in 0..<totalRows {
                            let cell = parent.cartUITableView.cellForRow(at: IndexPath(row: row, section: section)) as! calculatorTableViewCell
                            let txt1 = cell.itemPriceUITextField.text
                            parent.oldText? += Int(txt1 ?? "0") ?? 0
                        }
                    }
                    parent.totalSum = (parent.oldText ?? 0)
                    parent.totalUILabel.text = String(parent.totalSum ?? 0)
                }
            }) {
                
            }
        }
    }
}
