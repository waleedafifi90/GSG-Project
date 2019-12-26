//
//  StringExtenstion.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 23/09/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import Foundation
import UIKit
import SDWebImageSVGCoder

extension String {
    
    func isAlphanumeric() -> Bool {
        return self.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == nil && self != ""
    }
    
    func isAlphanumeric(ignoreDiacritics: Bool = false) -> Bool {
        if ignoreDiacritics {
            return self.range(of: "[a-zA-Z0-9 ]+", options: .regularExpression) == nil && self != ""
        }
        else {
            return self.isAlphanumeric()
        }
    }
    
    var isInt: Bool {
        return Int(self) != nil
    }
    
    var image_: UIImage? {
        return UIImage.init(named: self)
    }
    
    var localized_: String {
        return NSLocalizedString(self, comment: "")
    }
    
    var color_: UIColor {
        return UIColor.hexColor(hex: self)
    }
    
    func toDate(customFormat: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.init(identifier: "en")
        dateFormatter.calendar = Calendar.init(identifier: .gregorian)
        dateFormatter.timeZone = TimeZone.init(identifier: "UTC")
        dateFormatter.dateFormat = customFormat
        return dateFormatter.date(from: self) ?? Date()
    }
}
