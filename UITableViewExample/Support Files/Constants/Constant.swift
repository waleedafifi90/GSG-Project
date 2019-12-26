//
//  Constant.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 16/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import Foundation
import UIKit

class Constant {
    static let shared = Constant()
    
    var color: [Int]? = []
    
    var size: [Any]? = []
    
    var productName: String?
    
    var productQuantity: Int?
     
    var priceRange: [String : CGFloat] = [:]
    
    var isDefualtConstant: Bool = true
    
    var apiCurrentPage: Int = 1
    
    var apiLastPage: Int = 1
    
    var apiPerPage: Int = 1
    
    var apiTotal: Int = 1
    
    var productId: Int = 1
    
    class func isColorSelected(index: Int) -> Bool {
        if let checked = Constant.shared.color?.firstIndex(where: { $0 as? Int == index }) {
            print("Selected = \(checked)")
            return true
        }
        return false
    }

    class func filterObjects() -> [Any] {
        
        return [""]
    }
}



enum filterColor {
    case Rajah, Puerto_Rico, Blue_Bell, Jagged_Ice, Chestnut_Rose, All
    
    var color: UIColor {
        switch self {
        case .Rajah:
            return #colorLiteral(red: 1, green: 0.7038665414, blue: 0.3847679496, alpha: 1)
        case .Puerto_Rico:
            return #colorLiteral(red: 0, green: 0.8087422252, blue: 0.7722411752, alpha: 1)
        case .Blue_Bell:
            return #colorLiteral(red: 0.6054744124, green: 0.605568707, blue: 0.77598387, alpha: 1)
        case .Jagged_Ice:
            return #colorLiteral(red: 0.6882438064, green: 0.9048333168, blue: 0.8726850152, alpha: 1)
        case .Chestnut_Rose:
            return #colorLiteral(red: 0.9439609647, green: 0.2802464664, blue: 0.3580211401, alpha: 1)
        case .All:
            return #colorLiteral(red: 0.9352622628, green: 0.9353966117, blue: 0.9352328777, alpha: 1)
        }
    }
    
    var colorHex: String {
        switch self {
        case .Rajah:
            return "F7B267"
        case .Puerto_Rico:
            return "4ECDC4"
        case .Blue_Bell:
            return "9999C3"
        case .Jagged_Ice:
            return "9999C3"
        case .Chestnut_Rose:
            return "D1495B"
        case .All:
            return "ffffff"
        }
    }
    
    var name: String {
        get { return String(describing: self) }
    }
    
    var description: String {
        get { return String(reflecting: self) }
    }
}

enum Filtersize {
    case xs, s, m, l, xl, xxl, all
    
    var sizeName: String {
        switch self {
        case .xs:
            return "XS"
        case .s:
            return "S"
        case .m:
            return "M"
        case .l:
            return "L"
        case .xl:
            return "XL"
        case .xxl:
            return "XXL"
        case .all:
            return "All"
        }
    }
}

