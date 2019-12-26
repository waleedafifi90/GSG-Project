//
//  CountryTranslation.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 07/11/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import Foundation


class CountryTranslation : NSObject, NSCoding{

    var br : String!
    var de : String!
    var es : String!
    var fa : String!
    var fr : String!
    var hr : String!
    var it : String!
    var ja : String!
    var nl : String!
    var pt : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        br = dictionary["br"] as? String
        de = dictionary["de"] as? String
        es = dictionary["es"] as? String
        fa = dictionary["fa"] as? String
        fr = dictionary["fr"] as? String
        hr = dictionary["hr"] as? String
        it = dictionary["it"] as? String
        ja = dictionary["ja"] as? String
        nl = dictionary["nl"] as? String
        pt = dictionary["pt"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if br != nil{
            dictionary["br"] = br
        }
        if de != nil{
            dictionary["de"] = de
        }
        if es != nil{
            dictionary["es"] = es
        }
        if fa != nil{
            dictionary["fa"] = fa
        }
        if fr != nil{
            dictionary["fr"] = fr
        }
        if hr != nil{
            dictionary["hr"] = hr
        }
        if it != nil{
            dictionary["it"] = it
        }
        if ja != nil{
            dictionary["ja"] = ja
        }
        if nl != nil{
            dictionary["nl"] = nl
        }
        if pt != nil{
            dictionary["pt"] = pt
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        br = aDecoder.decodeObject(forKey: "br") as? String
        de = aDecoder.decodeObject(forKey: "de") as? String
        es = aDecoder.decodeObject(forKey: "es") as? String
        fa = aDecoder.decodeObject(forKey: "fa") as? String
        fr = aDecoder.decodeObject(forKey: "fr") as? String
        hr = aDecoder.decodeObject(forKey: "hr") as? String
        it = aDecoder.decodeObject(forKey: "it") as? String
        ja = aDecoder.decodeObject(forKey: "ja") as? String
        nl = aDecoder.decodeObject(forKey: "nl") as? String
        pt = aDecoder.decodeObject(forKey: "pt") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if br != nil{
            aCoder.encode(br, forKey: "br")
        }
        if de != nil{
            aCoder.encode(de, forKey: "de")
        }
        if es != nil{
            aCoder.encode(es, forKey: "es")
        }
        if fa != nil{
            aCoder.encode(fa, forKey: "fa")
        }
        if fr != nil{
            aCoder.encode(fr, forKey: "fr")
        }
        if hr != nil{
            aCoder.encode(hr, forKey: "hr")
        }
        if it != nil{
            aCoder.encode(it, forKey: "it")
        }
        if ja != nil{
            aCoder.encode(ja, forKey: "ja")
        }
        if nl != nil{
            aCoder.encode(nl, forKey: "nl")
        }
        if pt != nil{
            aCoder.encode(pt, forKey: "pt")
        }
    }
}
