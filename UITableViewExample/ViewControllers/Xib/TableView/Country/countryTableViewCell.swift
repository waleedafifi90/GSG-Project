//
//  countryTableViewCell.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 20/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
import SDWebImageSVGCoder

class countryTableViewCell: UITableViewCell {

    @IBOutlet weak var flagUIImage: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblSymbole: UILabel!
    
    var objects: Country?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell() {
        
        let SVGCoder = SDImageSVGCoder.shared
        SDImageCodersManager.shared.addCoder(SVGCoder)
        let SVGImageSize = CGSize(width: 50, height: 40)
        self.flagUIImage.sd_setImage(with: URL(string: objects?.flag ?? ""), placeholderImage: nil, options: [], context: [.svgImageSize : SVGImageSize])

        self.lblName.text = objects?.name
        
        self.lblSymbole.text = objects?.symbol
    }
    
}

