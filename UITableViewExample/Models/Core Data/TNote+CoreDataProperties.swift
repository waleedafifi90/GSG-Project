//
//  TNote+CoreDataProperties.swift
//  
//
//  Created by Waleed Afifi on 21/10/2019.
//
//

import Foundation
import CoreData


extension TNote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TNote> {
        return NSFetchRequest<TNote>(entityName: "TNote")
    }

    @NSManaged public var details: String?
    @NSManaged public var id: Int32
    @NSManaged public var title: String?

}
