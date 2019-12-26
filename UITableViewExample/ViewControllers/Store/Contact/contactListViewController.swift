//
//  contactListViewController.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 13/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit
import Alamofire

class contactListViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var contactObjects: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib.init(nibName: "contactListTableViewCell", bundle: nil), forCellReuseIdentifier: "contactListTableViewCell")

        let BaseURL = "https://jsonplaceholder.typicode.com/"
        let ContactURL = BaseURL + "users/"
        let parameters: [String : Any] = [:]
        let headers: HTTPHeaders = [:]
        let method: HTTPMethod = .get
        
        guard let url = URL.init(string: ContactURL) else { return }
        AF.request(url, method: method, parameters: parameters, headers: headers, interceptor: nil).validate().responseData { response in
        switch response.result {
        case .success(let data):
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [Dictionary<String, Any>]
                for item in json ?? [] {
                    self.contactObjects.append(Contact(contactName:item["name"] as? String, contactEmail: item["email"] as? String))
                    self.tableView.reloadData()
                }
            } catch (let error) {
                debugPrint(error)
            }
        case .failure(let error):
            debugPrint(error)
        }
            
        }
    }
}

extension contactListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactListTableViewCell", for: indexPath) as! contactListTableViewCell
        let obj = contactObjects[indexPath.row]
        cell.objects = obj
        cell.configurCell()
        return cell
    }
    
    
}

