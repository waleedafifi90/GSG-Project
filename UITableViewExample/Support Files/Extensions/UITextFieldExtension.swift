//
//  UITextFieldExtension.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 17/09/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import Foundation
import UIKit

extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
    
    @IBInspectable var paddingLeft: CGFloat {
           get {
               return leftView!.frame.size.width
           }
           set {
               let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
               leftView = paddingView
               leftViewMode = .always
           }
       }

       @IBInspectable var paddingRight: CGFloat {
           get {
               return rightView!.frame.size.width
           }
           set {
               let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
               rightView = paddingView
               rightViewMode = .always
           }
       }
}
