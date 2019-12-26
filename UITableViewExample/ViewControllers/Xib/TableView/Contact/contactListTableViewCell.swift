//
//  contactListTableViewCell.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 13/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit

class contactListTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblEmail: UILabel!
    
    var objects: Contact?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configurCell() {
        self.lblName.text = objects?.contactName
        
        self.lblEmail.text = objects?.contactEmail
    }
}
