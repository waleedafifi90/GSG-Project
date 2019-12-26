//
//  CountryLanguage.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 07/11/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import Foundation


class CountryLanguage : NSObject, NSCoding{

    var iso6391 : String!
    var iso6392 : String!
    var name : String!
    var nativeName : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        iso6391 = dictionary["iso639_1"] as? String
        iso6392 = dictionary["iso639_2"] as? String
        name = dictionary["name"] as? String
        nativeName = dictionary["nativeName"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if iso6391 != nil{
            dictionary["iso639_1"] = iso6391
        }
        if iso6392 != nil{
            dictionary["iso639_2"] = iso6392
        }
        if name != nil{
            dictionary["name"] = name
        }
        if nativeName != nil{
            dictionary["nativeName"] = nativeName
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        iso6391 = aDecoder.decodeObject(forKey: "iso639_1") as? String
        iso6392 = aDecoder.decodeObject(forKey: "iso639_2") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
        nativeName = aDecoder.decodeObject(forKey: "nativeName") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if iso6391 != nil{
            aCoder.encode(iso6391, forKey: "iso639_1")
        }
        if iso6392 != nil{
            aCoder.encode(iso6392, forKey: "iso639_2")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if nativeName != nil{
            aCoder.encode(nativeName, forKey: "nativeName")
        }
    }
}
