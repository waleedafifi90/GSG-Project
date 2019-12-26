//
//  Country.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 20/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import Foundation
import UIKit

class Country {
    
    var name: String?
    
    var flag: String?
    
    var symbol: String?
    
    init(countryName: String, countryFlag: String, countrySymbole: String) {
        
        self.name = countryName
        
        self.flag = countryFlag
        
        self.symbol = countrySymbole
    }
}


