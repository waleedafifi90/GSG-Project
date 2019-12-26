//
//  sideMenuTableViewCell.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 26/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit

class sideMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var menuIcon: UIImageView!
    
    @IBOutlet weak var menuLabel: UILabel!
        
    var objects: Menu?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell() {
        self.menuIcon.image = objects?.icon?.image_
        
        self.menuLabel.text = objects?.label
    }
    
}
