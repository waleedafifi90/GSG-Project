//
//  colorFillterCollectionViewCell.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 16/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit
import BEMCheckBox

class colorFillterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var fillterColorUIView: UIView!
    
    @IBOutlet weak var fillterColorCheckBook: BEMCheckBox!
    
    var indexPath: IndexPath?
    
    var object: ProductColor?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fillterColorCheckBook.delegate = self
    }
    
    func configureColorCell() {
        if let obj = self.object {
            self.fillterColorUIView.backgroundColor = UIColor.hexColor(hex: obj.colorHex ?? "eeeeee")
            
            if Constant.isColorSelected(index: indexPath?.row ?? 0) == true {
                self.fillterColorCheckBook.on = true
            }
        }
    }
}

extension colorFillterCollectionViewCell: BEMCheckBoxDelegate {
    func didTap(_ checkBox: BEMCheckBox) {
        if checkBox.on {
//            let all_ = String(object?.name ?? "")
//            if all_ == "All" {
//                debugPrint(object?.name)
//                if let parent = parentViewController as? FillterViewController {
//                    let totalRows = parent.colorCollectionView.numberOfItems(inSection: 0)
//                    for row in 0..<totalRows
//                    {
//                        let cell = parent.colorCollectionView.cellForItem(at: IndexPath(row: row, section: 0)) as! colorFillterCollectionViewCell
//                        cell.fillterColorCheckBook.on = true
//                    }
//                }
//            }
            let vc = parentViewController as? itemDetailsViewController
            vc?.selectedColor = indexPath?.row
        }
    }
}
