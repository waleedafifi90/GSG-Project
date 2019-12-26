//
//  HomeCategoryCollectionViewCell.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 29/09/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit
import SDWebImage
import Cosmos

class HomeCategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productImagr: UIImageView!
    
    @IBOutlet weak var productName: UILabel!
    
    @IBOutlet weak var starImage: UIImageView!
    
    @IBOutlet weak var productDisc: UILabel!
    
    @IBOutlet weak var productPrice: UILabel!
    
    @IBOutlet weak var rateView: CosmosView!
    
    @IBOutlet weak var btnFav: UIButton!
    
    var objects: Product?
    
    var indexPath: IndexPath?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell() {
        self.productName.text = objects?.productName
        
        self.productImagr.sd_setImage(with: URL(string: objects?.productImage ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
        
        self.productDisc.text = objects?.productDescription
        
        self.productPrice.text = objects?.productPrice?.description
        
        self.rateView.rating = objects?.productRate ?? 0
        
        if objects?.isFav == true {
            self.btnFav.setImage("icHeartActive".image_, for: .normal)
        }
    }
    
    @IBAction func addToFav(_ sender: Any) {
    }
    
    @IBAction func addToCart(_ sender: Any) {
        
    }
}
