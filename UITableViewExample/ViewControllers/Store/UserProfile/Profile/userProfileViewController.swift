//
//  userProfileViewController.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 23/11/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import Foundation
import UIKit
import Presentr

class userProfileViewController: UIViewController {

    @IBOutlet weak var txtFirstName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    
    @IBOutlet weak var txtPhone: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    let presenter: Presentr = {
        let width = ModalSize.full
        let height = ModalSize.fluid(percentage: 1)
        let center = ModalCenterPosition.customOrigin(origin: CGPoint(x: 0, y: 0))
        let customType = PresentationType.custom(width: width, height: height, center: center)

        let customPresenter = Presentr(presentationType: customType)
        customPresenter.transitionType = .coverVerticalFromTop
        customPresenter.dismissTransitionType = .crossDissolve
        customPresenter.roundCorners = false
        customPresenter.backgroundColor = .darkGray
        customPresenter.backgroundOpacity = 0.5
        customPresenter.dismissOnSwipe = true
        customPresenter.dismissOnSwipeDirection = .top
        return customPresenter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
        localization()
        fetchData()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {        AppDelegate.shared.rootNavigationViewController.isNavigationBarHidden = false
    }

    @IBAction func btnSave(_ sender: Any) {
        
    }
    
    @IBAction func btnChangePassword(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "changePasswordViewController")
        let navigationViewController = UINavigationController(rootViewController: vc)
        customPresentViewController(presenter, viewController: navigationViewController, animated: true)
    }
    
    @IBAction func btnPaymentMethod(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "paymentMethodViewController")
        let navigationViewController = UINavigationController(rootViewController: vc)
        customPresentViewController(presenter, viewController: navigationViewController, animated: true)
    }
    
}

extension userProfileViewController {
    func setupView() {
        
    }
    
    func localization() {
        
    }
    
    func setupData() {
        
    }
    
    func fetchData() {
        
    }
}
