//
//  FollowerViewController.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 17/09/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit

class FollowerViewController: UIViewController {

    var followerObjects: [FollowerClass] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        localization()
        setupData()
        fetchData()
    }
    
}

extension FollowerViewController {
    
    func setupView() {
    }
    
    func localization() {
    }
    
    func setupData() {
        
        self.followerObjects.append(FollowerClass(name: "Collin Fields", rate: "50 Rated Restaurant", image: "avatar"))
        self.followerObjects.append(FollowerClass(name: "Zaria Walls", rate: "49 Rated Restaurant", image: "avatar1"))
        self.followerObjects.append(FollowerClass(name: "Harold Rhodes", rate: "48 Rated Restaurant", image: "avatar2"))
        self.followerObjects.append(FollowerClass(name: "Juliette Bruce", rate: "45 Rated Restaurant", image: "avatar3"))
        self.followerObjects.append(FollowerClass(name: "Christian Ballard", rate: "40 Rated Restaurant", image: "avatar"))
        self.followerObjects.append(FollowerClass(name: "Aurora Luna", rate: "38 Rated Restaurant", image: "avatar1"))
        self.followerObjects.append(FollowerClass(name: "Cassie Bautista", rate: "35 Rated Restaurant", image: "avatar2"))
        self.followerObjects.append(FollowerClass(name: "Darwin Gomez", rate: "30 Rated Restaurant", image: "avatar3"))
        self.followerObjects.append(FollowerClass(name: "Justice Mason", rate: "25 Rated Restaurant", image: "avatar"))
    }
    
    func fetchData() {
    }
}

extension FollowerViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.followerObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let followCell: followerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "followerTableViewCell") as! followerTableViewCell
        let obj = self.followerObjects[indexPath.row]
        followCell.followerObject = obj
        followCell.configurCell()
        
        return followCell
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
           return true
       }
       
       func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
           return .delete
       }
       
       func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
           let delete = UITableViewRowAction.init(style: .destructive, title: "Delete") { (action, index) in
            let obj = self.followerObjects[indexPath.row]
            self.showAlertPopUp(title: "Error", message: "\(obj.name)", buttonAction1: {
                self.followerObjects.remove(at: indexPath.row)
                tableView.reloadData()
            }) {
                           
                }
            }
           
           return [delete]
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected")
       
    }
    
    
}
