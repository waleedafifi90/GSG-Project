//
//  mainNavigationViewController.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 21/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit

class mainNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        localization()
        setupData()
        fetchData()
        // Do any additional setup after loading the view.
    }
}

extension mainNavigationViewController {
    func setupView() {
        AppDelegate.shared.rootNavigationViewController = self
//        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationBar.shadowImage = UIImage()
    }
    
    func localization() {
        
    }
    
    func setupData() {
        
    }
    
    func fetchData() {
        
    }
}
