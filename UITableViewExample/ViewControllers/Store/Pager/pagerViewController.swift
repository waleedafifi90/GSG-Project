//
//  pagerViewController.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 17/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class pagerViewController: ButtonBarPagerTabStripViewController {
    
    
    override func viewDidLoad() {
        setupView()
        super.viewDidLoad()
        localization()
        setupData()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        AppDelegate.shared.rootNavigationViewController.isNavigationBarHidden = false
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_1 = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "reviewsViewController")
        let child_2 = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "relatedItemsViewController")
        let child_3 = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "itemDetailsViewController")
        return [child_3, child_2, child_1]
    }
    
    
}

extension pagerViewController {
    func setupView() {
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarBackgroundColor = "#FF6E66".color_
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = "969696".color_
            newCell?.label.textColor = "505050".color_
        }
    }
    
    func localization() {
        
    }
    
    func setupData() {
        
    }
    
    func fetchData() {
        
    }
}

