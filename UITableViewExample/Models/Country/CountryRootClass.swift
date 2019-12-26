//
//  CountryRootClass.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 07/11/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import Foundation


class CountryRootClass : NSObject, NSCoding{

    var alpha2Code : String!
    var alpha3Code : String!
    var altSpellings : [String]!
    var area : Int!
    var borders : [String]!
    var callingCodes : [String]!
    var capital : String!
    var cioc : String!
    var currencies : [CountryCurrency]!
    var demonym : String!
    var flag : String!
    var gini : AnyObject!
    var languages : [CountryLanguage]!
    var latlng : [Int]!
    var name : String!
    var nativeName : String!
    var numericCode : String!
    var population : Int!
    var region : String!
    var regionalBlocs : [CountryRegionalBloc]!
    var subregion : String!
    var timezones : [String]!
    var topLevelDomain : [String]!
    var translations : CountryTranslation!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        alpha2Code = dictionary["alpha2Code"] as? String
        alpha3Code = dictionary["alpha3Code"] as? String
        area = dictionary["area"] as? Int
        capital = dictionary["capital"] as? String
        cioc = dictionary["cioc"] as? String
        demonym = dictionary["demonym"] as? String
        flag = dictionary["flag"] as? String
        gini = dictionary["gini"] as? AnyObject
        name = dictionary["name"] as? String
        nativeName = dictionary["nativeName"] as? String
        numericCode = dictionary["numericCode"] as? String
        population = dictionary["population"] as? Int
        region = dictionary["region"] as? String
        subregion = dictionary["subregion"] as? String
        if let translationsData = dictionary["translations"] as? [String:Any]{
            translations = CountryTranslation(fromDictionary: translationsData)
        }
        currencies = [CountryCurrency]()
        if let currenciesArray = dictionary["currencies"] as? [[String:Any]]{
            for dic in currenciesArray{
                let value = CountryCurrency(fromDictionary: dic)
                currencies.append(value)
            }
        }
        languages = [CountryLanguage]()
        if let languagesArray = dictionary["languages"] as? [[String:Any]]{
            for dic in languagesArray{
                let value = CountryLanguage(fromDictionary: dic)
                languages.append(value)
            }
        }
        regionalBlocs = [CountryRegionalBloc]()
        if let regionalBlocsArray = dictionary["regionalBlocs"] as? [[String:Any]]{
            for dic in regionalBlocsArray{
                let value = CountryRegionalBloc(fromDictionary: dic)
                regionalBlocs.append(value)
            }
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if alpha2Code != nil{
            dictionary["alpha2Code"] = alpha2Code
        }
        if alpha3Code != nil{
            dictionary["alpha3Code"] = alpha3Code
        }
        if area != nil{
            dictionary["area"] = area
        }
        if capital != nil{
            dictionary["capital"] = capital
        }
        if cioc != nil{
            dictionary["cioc"] = cioc
        }
        if demonym != nil{
            dictionary["demonym"] = demonym
        }
        if flag != nil{
            dictionary["flag"] = flag
        }
        if gini != nil{
            dictionary["gini"] = gini
        }
        if name != nil{
            dictionary["name"] = name
        }
        if nativeName != nil{
            dictionary["nativeName"] = nativeName
        }
        if numericCode != nil{
            dictionary["numericCode"] = numericCode
        }
        if population != nil{
            dictionary["population"] = population
        }
        if region != nil{
            dictionary["region"] = region
        }
        if subregion != nil{
            dictionary["subregion"] = subregion
        }
        if translations != nil{
            dictionary["translations"] = translations.toDictionary()
        }
        if currencies != nil{
            var dictionaryElements = [[String:Any]]()
            for currenciesElement in currencies {
                dictionaryElements.append(currenciesElement.toDictionary())
            }
            dictionary["currencies"] = dictionaryElements
        }
        if languages != nil{
            var dictionaryElements = [[String:Any]]()
            for languagesElement in languages {
                dictionaryElements.append(languagesElement.toDictionary())
            }
            dictionary["languages"] = dictionaryElements
        }
        if regionalBlocs != nil{
            var dictionaryElements = [[String:Any]]()
            for regionalBlocsElement in regionalBlocs {
                dictionaryElements.append(regionalBlocsElement.toDictionary())
            }
            dictionary["regionalBlocs"] = dictionaryElements
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        alpha2Code = aDecoder.decodeObject(forKey: "alpha2Code") as? String
        alpha3Code = aDecoder.decodeObject(forKey: "alpha3Code") as? String
        altSpellings = aDecoder.decodeObject(forKey: "altSpellings") as? [String]
        area = aDecoder.decodeObject(forKey: "area") as? Int
        borders = aDecoder.decodeObject(forKey: "borders") as? [String]
        callingCodes = aDecoder.decodeObject(forKey: "callingCodes") as? [String]
        capital = aDecoder.decodeObject(forKey: "capital") as? String
        cioc = aDecoder.decodeObject(forKey: "cioc") as? String
        currencies = aDecoder.decodeObject(forKey: "currencies") as? [CountryCurrency]
        demonym = aDecoder.decodeObject(forKey: "demonym") as? String
        flag = aDecoder.decodeObject(forKey: "flag") as? String
        gini = aDecoder.decodeObject(forKey: "gini") as? AnyObject
        languages = aDecoder.decodeObject(forKey: "languages") as? [CountryLanguage]
        latlng = aDecoder.decodeObject(forKey: "latlng") as? [Int]
        name = aDecoder.decodeObject(forKey: "name") as? String
        nativeName = aDecoder.decodeObject(forKey: "nativeName") as? String
        numericCode = aDecoder.decodeObject(forKey: "numericCode") as? String
        population = aDecoder.decodeObject(forKey: "population") as? Int
        region = aDecoder.decodeObject(forKey: "region") as? String
        regionalBlocs = aDecoder.decodeObject(forKey: "regionalBlocs") as? [CountryRegionalBloc]
        subregion = aDecoder.decodeObject(forKey: "subregion") as? String
        timezones = aDecoder.decodeObject(forKey: "timezones") as? [String]
        topLevelDomain = aDecoder.decodeObject(forKey: "topLevelDomain") as? [String]
        translations = aDecoder.decodeObject(forKey: "translations") as? CountryTranslation
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if alpha2Code != nil{
            aCoder.encode(alpha2Code, forKey: "alpha2Code")
        }
        if alpha3Code != nil{
            aCoder.encode(alpha3Code, forKey: "alpha3Code")
        }
        if altSpellings != nil{
            aCoder.encode(altSpellings, forKey: "altSpellings")
        }
        if area != nil{
            aCoder.encode(area, forKey: "area")
        }
        if borders != nil{
            aCoder.encode(borders, forKey: "borders")
        }
        if callingCodes != nil{
            aCoder.encode(callingCodes, forKey: "callingCodes")
        }
        if capital != nil{
            aCoder.encode(capital, forKey: "capital")
        }
        if cioc != nil{
            aCoder.encode(cioc, forKey: "cioc")
        }
        if currencies != nil{
            aCoder.encode(currencies, forKey: "currencies")
        }
        if demonym != nil{
            aCoder.encode(demonym, forKey: "demonym")
        }
        if flag != nil{
            aCoder.encode(flag, forKey: "flag")
        }
        if gini != nil{
            aCoder.encode(gini, forKey: "gini")
        }
        if languages != nil{
            aCoder.encode(languages, forKey: "languages")
        }
        if latlng != nil{
            aCoder.encode(latlng, forKey: "latlng")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if nativeName != nil{
            aCoder.encode(nativeName, forKey: "nativeName")
        }
        if numericCode != nil{
            aCoder.encode(numericCode, forKey: "numericCode")
        }
        if population != nil{
            aCoder.encode(population, forKey: "population")
        }
        if region != nil{
            aCoder.encode(region, forKey: "region")
        }
        if regionalBlocs != nil{
            aCoder.encode(regionalBlocs, forKey: "regionalBlocs")
        }
        if subregion != nil{
            aCoder.encode(subregion, forKey: "subregion")
        }
        if timezones != nil{
            aCoder.encode(timezones, forKey: "timezones")
        }
        if topLevelDomain != nil{
            aCoder.encode(topLevelDomain, forKey: "topLevelDomain")
        }
        if translations != nil{
            aCoder.encode(translations, forKey: "translations")
        }
    }
}
