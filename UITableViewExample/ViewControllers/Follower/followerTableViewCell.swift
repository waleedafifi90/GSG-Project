//
//  followerTableViewCell.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 21/09/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit

class followerTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImage: UIImageView!
    
    @IBOutlet weak var nameUILable: UILabel!
    
    @IBOutlet weak var rateUILable: UILabel!

    var followerObject: FollowerClass?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configurCell() {
        self.nameUILable.text = followerObject?.name
        self.rateUILable.text = followerObject?.rate
        self.avatarImage.image = UIImage(named: followerObject?.image ?? "")
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}

