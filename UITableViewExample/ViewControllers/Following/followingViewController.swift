//
//  followingViewController.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 22/09/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit

class followingViewController: UIViewController {

    var followingObjects: [FollowingClass] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        localization()
        setupData()
        fetchData()
    }

}

extension followingViewController {
    func setupView() {
        
    }
    
    func localization() {
        
    }
    
    func setupData() {
        
        self.followingObjects.append(FollowingClass(name: "Collin Fields", followingRate: "50 Rated Restaurant", image: "avatar"))
        self.followingObjects.append(FollowingClass(name: "Zaria Walls", followingRate: "49 Rated Restaurant", image: "avatar1"))
        self.followingObjects.append(FollowingClass(name: "Harold Rhodes", followingRate: "48 Rated Restaurant", image: "avatar2"))
        self.followingObjects.append(FollowingClass(name: "Juliette Bruce", followingRate: "45 Rated Restaurant", image: "avatar3"))
        self.followingObjects.append(FollowingClass(name: "Christian Ballard", followingRate: "40 Rated Restaurant", image: "avatar"))
        self.followingObjects.append(FollowingClass(name: "Aurora Luna", followingRate: "38 Rated Restaurant", image: "avatar1"))
        self.followingObjects.append(FollowingClass(name: "Cassie Bautista", followingRate: "35 Rated Restaurant", image: "avatar2"))
        self.followingObjects.append(FollowingClass(name: "Darwin Gomez", followingRate: "30 Rated Restaurant", image: "avatar3"))
        self.followingObjects.append(FollowingClass(name: "Justice Mason", followingRate: "25 Rated Restaurant", image: "avatar"))
    }
    
    func fetchData() {
        
    }
}

extension followingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return followingObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let followingCell: followingTableViewCell = tableView.dequeueReusableCell(withIdentifier: "followingCell", for: indexPath) as! followingTableViewCell
        var obj = followingObjects[indexPath.row]
        followingCell.followingObjects = obj
        followingCell.configureFollowing()
        return followingCell
    }
    
    
}

extension followingViewController: UITableViewDelegate {
    
}
