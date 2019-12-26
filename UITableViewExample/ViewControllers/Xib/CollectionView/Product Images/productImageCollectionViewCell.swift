//
//  productImageCollectionViewCell.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 15/11/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit

class productImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productImage: UIImageView!
    
    var object: ProductImages?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell() {
        productImage.sd_setImage(with: URL(string: object?.s_image ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
    }
}
