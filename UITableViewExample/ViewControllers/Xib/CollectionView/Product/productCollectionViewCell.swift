//
//  productCollectionViewCell.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 29/09/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit

class productCollectionViewCell: GeneralCollectionViewCell {
    
    @IBOutlet weak var lblCategoryName: UILabel!
    
    @IBOutlet weak var viewSelection: UIView!
    
    var objects: HomeCategoryClass?
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func configureCell() {
        
        self.lblCategoryName.text = objects?.cellTitle
            
        if let parent = self.parentViewController as? HomeViewController {
            self.selection(isSelected: parent.selectedCategoryItem == indexPath?.row)
        }
    }

}

extension productCollectionViewCell {
    func selection(isSelected: Bool) {
        self.viewSelection.backgroundColor = isSelected ?  UIColor.hexColor(hex: "FF6E66") : .white
        self.lblCategoryName.alpha = isSelected ? 1 : 0.5
    }
}
