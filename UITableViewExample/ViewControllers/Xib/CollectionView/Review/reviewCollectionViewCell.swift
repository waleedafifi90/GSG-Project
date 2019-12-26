//
//  reviewCollectionViewCell.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 16/11/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit
import Cosmos

class reviewCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var reviewImage: UIImageView!
    
    @IBOutlet weak var reviewerName: UILabel!
    
    @IBOutlet weak var rateView: CosmosView!
    
    @IBOutlet weak var txtReview: UILabel!
    
    var object: ProductReview?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell() {
        // Cell Configuration Function
        reviewerName.text = object?.name
        
        rateView.rating = object?.i_rate ?? 1
        
        txtReview.text = object?.s_review
        
        reviewImage.sd_setImage(with: URL(string: object?.image ?? ""), placeholderImage: UIImage(named: "placeholders.png"))
    }
}
