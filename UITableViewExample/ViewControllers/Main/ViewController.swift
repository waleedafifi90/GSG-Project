//
//  ViewController.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 17/09/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var blueView: UIView!
    
    
    var objects: [MainClass] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    @IBAction func btnSearch(_ sender: Any) {
    }
    
}

extension ViewController {
    
    func setupView() {
        blueView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
//        .layerMaxXMinYCorner,
//        .layerMinXMaxYCorner

    }
    
    func localization() {
    }
    
    func setupData() {
        self.objects.append(MainClass.init(image: "UITableCellItalian", gradiant: "UITableCellItalianGradiant", cellTitle: "Italian"))
        self.objects.append(MainClass.init(image: "UITableCellChianese", gradiant: "UITableCellChianeseGradiant", cellTitle: "Chainese"))
        self.objects.append(MainClass.init(image: "UITableCellMaxican", gradiant: "UITableCellMaxicanGradiant", cellTitle: "Maxican"))
        self.objects.append(MainClass.init(image: "UITableCellThai", gradiant: "UITableCellThaiGradiant", cellTitle: "Thai"))
        self.objects.append(MainClass.init(image: "UITableCellArabian", gradiant: "UITableCellArabianGradiant", cellTitle: "Arabian"))
        self.objects.append(MainClass.init(image: "UITableCellIndian", gradiant: "UITableCellIndianGradiant", cellTitle: "Indian"))
        self.objects.append(MainClass.init(image: "UITableCellAmerican", gradiant: "UITableCellAmericanGradiant", cellTitle: "American"))
        self.objects.append(MainClass.init(image: "UITableCellKorean", gradiant: "UITableCellKoreanGradiant", cellTitle: "Korean"))

    }
    
    func fetchData() {
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: mainTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! mainTableViewCell
        let obj = self.objects[indexPath.row]
        cell.objects = obj
        cell.configurCell()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction.init(style: .destructive, title: "Delete") { (action, index) in
            
        }
        
        return [delete]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("test")
        let obj = self.objects[indexPath.row]
        showAlertPopUp(title: "Error", message: "\(obj.cellTitle)", buttonAction1: {
            
        }) {
            
        }
    }
    
}

//
//extension UITabBarItem {
//   @IBInspectable  var isShowOriginalImage: Bool {
//        set {
//            let img = self.selectedImage?.withRenderingMode(.alwaysOriginal)
//            self.selectedImage = newValue == true ? img : self.selectedImage
//        } get {
//            return false
//        }
//    }
//}
