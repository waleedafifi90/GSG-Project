//
//  UserProfile.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 14/11/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import Foundation
import CoreData

class User {
    
    var id: Int
    
    var username: String?
    
    var access_token: String?
    
    var email: String?
    
    var avatar: String?
    
    init(id: Int, username: String, access_token: String, email: String, avatar: String) {
        self.access_token = access_token
        
        self.email = email
        
        self.avatar = avatar
        
        self.username = username
        
        self.id = id
    }
    
    static var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "UITableViewExample")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    static func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                print("SAVED")
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
