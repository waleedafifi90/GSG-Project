//
//  noteTableViewCell.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 20/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit

class noteTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblDetails: UILabel!
    
    var objects: Note?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell() {
        
        lblTitle.text = objects?.title
        
        lblDetails.text = objects?.details
    }
    
}
