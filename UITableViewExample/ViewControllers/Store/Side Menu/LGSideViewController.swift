//
//  LGSideViewController.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 26/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit
import LGSideMenuController

class LGSideViewController: LGSideMenuController {
    
    let rootVC = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "HomeViewController")
    
    let leftVC = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "leftMenuViewController")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        localization()
        setupData()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension LGSideViewController {
    func setupView() {
        self.rootViewController = self.rootVC
        self.leftViewController = self.leftVC
        self.leftViewWidth = UIScreen.main.bounds.width * 0.8
        self.leftViewPresentationStyle = .slideBelow
    }
    
    func localization() { }
    
    func setupData() { }
    
    func fetchData() { }
}
