//
//  countryViewController.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 20/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class countryViewController: UIViewController {
    
    @IBOutlet weak var countryUITableView: UITableView!
    
    var countryObjects: [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        localization()
        setupData()
        fetchData()
        // Do any additional setup after loading the view.
    }
}

extension countryViewController {
    func setupView() {
        countryUITableView.register(UINib.init(nibName: "countryTableViewCell", bundle: nil), forCellReuseIdentifier: "countryTableViewCell")
    }
    
    func localization() {
        
    }
    
    func setupData() {
        
    }
    
    func fetchData() {
        let request = BaseRequest()
        let urlExt = "rest"
        let apiVersion = "v2"
        request.url = "\(urlExt)/\(apiVersion)/all"
        request.method = .get
        
        RequestBuilder.requestWithSuccessFullResponse(request: request) { (json) in
            self.countryObjects.removeAll()
            for item in json.array ?? [] {
                let currencies = item["currencies"].arrayValue
                self.countryObjects.append(Country(countryName: item["nativeName"].stringValue, countryFlag: item["flag"].stringValue, countrySymbole: currencies[0]["symbol"].stringValue))
            }
            self.countryUITableView.reloadData()
        }
    }
}

extension countryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryTableViewCell", for: indexPath) as! countryTableViewCell
        let obj = countryObjects[indexPath.row]
        cell.objects = obj
        cell.configureCell()
        return cell
    }
    
    
}
