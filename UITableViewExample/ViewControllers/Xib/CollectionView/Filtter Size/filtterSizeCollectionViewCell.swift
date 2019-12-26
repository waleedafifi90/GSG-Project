//
//  filtterSizeCollectionViewCell.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 16/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit
import BEMCheckBox

class filtterSizeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblSize: UILabel!
    
    @IBOutlet weak var sizeCheckBox: BEMCheckBox!
    
    var indexPath: IndexPath?
    
    var object: ProductSize?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell() {
        if let obj = self.object {
            self.lblSize.text = obj.s_name
        }
    }

}

extension filtterSizeCollectionViewCell: BEMCheckBoxDelegate {
    func didTap(_ checkBox: BEMCheckBox) {
        
    }
}
