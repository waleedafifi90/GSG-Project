//
//  UserProfile.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 10/11/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import Foundation

class UserProfile {
    static let shared = UserProfile()
    
    // get Phone number from user
    var accessToken: String? {
        get {
            return UserDefaults.standard.value(forKey: "accessToken") as? String
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "accessToken")
            UserDefaults.standard.synchronize()
        }
    }
    
    var userID: String? {
        get {
            return UserDefaults.standard.value(forKey: "userID") as? String
        } set {
            UserDefaults.standard.setValue(newValue, forKey: "userID")
            UserDefaults.standard.synchronize()
        }
    }
    
    func isUserLogin() -> Bool {
        return  accessToken != nil
    }
}
