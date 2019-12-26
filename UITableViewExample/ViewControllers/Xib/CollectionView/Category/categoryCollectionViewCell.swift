//
//  categoryCollectionViewCell.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 26/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit

class categoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    
    @IBOutlet weak var lblCategoryName: UILabel!
    
    var objects: Category?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        localization()
        setupData()
        fetchData()
    }

    func configureCell() {
        self.categoryImage.sd_setImage(with: URL(string: objects?.categoryImage ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
                
        self.lblCategoryName.text = objects?.categoryName
    }
}

extension categoryCollectionViewCell {
    func setupView() { }
    
    func localization() { }
    
    func setupData() { }
    
    func fetchData() { }
}
