//
//  TUser+CoreDataProperties.swift
//  
//
//  Created by Waleed Afifi on 14/11/2019.
//
//

import Foundation
import CoreData


extension TUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TUser> {
        return NSFetchRequest<TUser>(entityName: "TUser")
    }

    @NSManaged public var id: Int32
    @NSManaged public var access_token: String?
    @NSManaged public var username: String?
    @NSManaged public var email: String?
    @NSManaged public var address: String?
    @NSManaged public var avatar: String?

}
