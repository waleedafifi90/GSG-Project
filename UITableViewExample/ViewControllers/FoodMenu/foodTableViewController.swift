//
//  foodTableViewController.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 20/09/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit

class foodTableViewController: UIViewController {

    var objects: [MainClass] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        localization()
        setupData()
        fetchData()
    }
    
}

extension foodTableViewController {
    
    func setupView() {
        
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


extension foodTableViewController: UITableViewDataSource, UITableViewDelegate {
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
            self.showAlertPopUp(title: "Error", message: "Delete Confermation?", buttonAction1: {
                
            }) {
                
            }
        }
        
        return [delete]
    }
    
}
