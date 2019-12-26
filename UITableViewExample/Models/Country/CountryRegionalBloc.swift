//
//  CountryRegionalBloc.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 07/11/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import Foundation


class CountryRegionalBloc : NSObject, NSCoding{

    var acronym : String!
    var name : String!
    var otherAcronyms : [AnyObject]!
    var otherNames : [String]!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        acronym = dictionary["acronym"] as? String
        name = dictionary["name"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if acronym != nil{
            dictionary["acronym"] = acronym
        }
        if name != nil{
            dictionary["name"] = name
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        acronym = aDecoder.decodeObject(forKey: "acronym") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
        otherAcronyms = aDecoder.decodeObject(forKey: "otherAcronyms") as? [AnyObject]
        otherNames = aDecoder.decodeObject(forKey: "otherNames") as? [String]
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if acronym != nil{
            aCoder.encode(acronym, forKey: "acronym")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if otherAcronyms != nil{
            aCoder.encode(otherAcronyms, forKey: "otherAcronyms")
        }
        if otherNames != nil{
            aCoder.encode(otherNames, forKey: "otherNames")
        }
    }
}
