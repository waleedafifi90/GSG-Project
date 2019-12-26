//
//  followingTableViewCell.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 22/09/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit

class followingTableViewCell: UITableViewCell {

    @IBOutlet weak var followingNameUILabel: UILabel!
    
    @IBOutlet weak var followingRateUILabel: UILabel!
    
    @IBOutlet weak var followingImage: UIImageView!
    
    var followingObjects: FollowingClass?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureFollowing() {
        self.followingNameUILabel.text = followingObjects?.name
        
        self.followingRateUILabel.text = followingObjects?.followingRate
        
        self.followingImage.image = UIImage.init(named: followingObjects?.image ?? "")
        
    }

}
