//
//  Notes+CoreDataProperties.swift
//  
//
//  Created by Waleed Afifi on 21/10/2019.
//
//

import Foundation
import CoreData


extension Notes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Notes> {
        return NSFetchRequest<Notes>(entityName: "Notes")
    }

    @NSManaged public var id: Int32
    @NSManaged public var title: String?
    @NSManaged public var details: String?

}
