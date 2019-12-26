//
//  mainTableViewCell.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 19/09/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit

class mainTableViewCell: UITableViewCell {

    @IBOutlet weak var cellUIImage: UIImageView!
    
    @IBOutlet weak var gradiantUIImage: UIImageView!
    
    @IBOutlet weak var cellTitle: UILabel!
    
    var objects: MainClass?
    
    override func awakeFromNib() {
        super.awakeFromNib()
     }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configurCell() {
        if let obj = self.objects {
            self.cellUIImage.image = UIImage.init(named: obj.image ?? "")
            self.gradiantUIImage.image = UIImage.init(named: obj.gradiant ?? "")
            self.cellTitle.text = obj.cellTitle
        }
    }

}
