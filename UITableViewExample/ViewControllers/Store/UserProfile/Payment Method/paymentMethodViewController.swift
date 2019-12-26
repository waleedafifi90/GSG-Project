//
//  paymentMethodViewController.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 24/11/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import Foundation
import UIKit

class paymentMethodViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
        localization()
        fetchData()
    }

    override func viewWillAppear(_ animated: Bool) {
        AppDelegate.shared.rootNavigationViewController.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = UIColor.hexColor(hex: "FF6E66")
    }
    
    @IBAction func btnDismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension paymentMethodViewController {
    func setupView() {
        
    }
    
    func localization() {
        
    }
    
    func setupData() {
        
    }
    
    func fetchData() {
        
    }
}
