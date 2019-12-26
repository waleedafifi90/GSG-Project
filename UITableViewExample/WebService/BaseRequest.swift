//
//  BaseRequest.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 20/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class BaseRequest {
    var url: String = "https://mr-code.com/iOS/"
    
    var parameters: [String : Any] = [:]
        
    var method: HTTPMethod = .get
    
    var files: [BaseFile] = []
}
