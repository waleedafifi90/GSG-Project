//
//  RequestBuilder.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 20/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class RequestBuilder {
    static let shared = RequestBuilder()
    
     static var headers: HTTPHeaders {
        let dic: HTTPHeaders = ["Content-Type":"application/json"]
        return dic
    }

    class func request(request: BaseRequest, success: @escaping ((_ json: JSON) -> Void)) {
        guard let url = URL.init(string: "\(GlobalConstant.BaseURL)\(request.url)") else { return }
        AF.request(url, method: request.method, parameters: request.parameters, headers: self.headers, interceptor: nil).validate().responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let json = try JSON.init(data: data)
                    debugPrint("******* Request *******")
                    debugPrint("URL: \(url.absoluteString) -- Method: \(request.method) -- Response: \(json.stringValue)")
                    debugPrint("******* Request End *******")
                    success(json)
                }
                catch(let error) {
                    debugPrint(error.localizedDescription)
                }
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
}
