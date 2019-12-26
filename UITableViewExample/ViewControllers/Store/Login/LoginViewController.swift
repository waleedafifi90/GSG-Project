//
//  LoginViewController.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 29/09/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        localization()
        setupData()
        fetchData()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        if UserProfile.shared.accessToken != nil {
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "LGSideViewController")
            self.show(vc, sender: nil)
        }
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        let request = BaseRequest()
        let urlExt = "public/api"
        let apiVersion = "auth"
        request.url = "\(urlExt)/\(apiVersion)/login"
        request.method = .post
        
        request.parameters = ["email" : txtEmail.text ?? "", "password" : txtPassword.text ?? ""]
        
        RequestBuilder.requestWithSuccessFullResponse(request: request) { (json) in
            if json["access_token"] != "" {
                UserProfile.shared.accessToken = json["access_token"].rawString()
                UserProfile.shared.userID = json["user"]["id"].rawString()
                
                let user = TUser(context: User.context)
                user.access_token = json["access_token"].rawString()
                user.email = json["user"]["email"].rawString()
                user.id = json["user"]["id"].int32Value
                user.avatar = json["user"]["avatar"].rawString()
                user.address = json["user"]["address"].rawString()
                user.username = json["user"]["name"].rawString()
                User.saveContext()
                
                let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "LGSideViewController")
                self.show(vc, sender: nil)
            }
        }
    }
}

extension LoginViewController {
    func setupView() {
        #if DEBUG
        txtEmail.text = "waleedafifich@gmail.com"
        txtPassword.text = "waleed"
        #else
            return
        #endif
    }
    
    func localization() {
        
    }
    
    func setupData() {
        
    }
    
    func fetchData() {
        
    }
}
