//
//  CountryCurrency.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 07/11/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import Foundation


class CountryCurrency : NSObject, NSCoding{

    var code : String!
    var name : AnyObject!
    var symbol : AnyObject!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        code = dictionary["code"] as? String
        name = dictionary["name"] as? AnyObject
        symbol = dictionary["symbol"] as? AnyObject
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if code != nil{
            dictionary["code"] = code
        }
        if name != nil{
            dictionary["name"] = name
        }
        if symbol != nil{
            dictionary["symbol"] = symbol
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        code = aDecoder.decodeObject(forKey: "code") as? String
        name = aDecoder.decodeObject(forKey: "name") as? AnyObject
        symbol = aDecoder.decodeObject(forKey: "symbol") as? AnyObject
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if code != nil{
            aCoder.encode(code, forKey: "code")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if symbol != nil{
            aCoder.encode(symbol, forKey: "symbol")
        }
    }
}
