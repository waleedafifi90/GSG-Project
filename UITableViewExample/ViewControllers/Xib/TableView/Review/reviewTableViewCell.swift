//
//  reviewTableViewCell.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 15/11/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import Foundation
import UIKit
import Cosmos

class reviewTableViewCell: UITableViewCell {

    @IBOutlet weak var reviewImage: UIImageView!
    
    @IBOutlet weak var reviewerName: UILabel!
    
    @IBOutlet weak var rateView: CosmosView!
    
    @IBOutlet weak var txtReview: UILabel!
    
    var object: ProductReview?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell() {
        // Cell Configuration Function
        reviewerName.text = object?.name
        
        rateView.rating = object?.i_rate ?? 1
        
        txtReview.text = object?.s_review
        
        reviewImage.sd_setImage(with: URL(string: object?.image ?? ""), placeholderImage: UIImage(named: "placeholders.png"))
    }
    
}
