//
//  calculatorViewController.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 22/09/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit

class calculatorViewController: UIViewController {

    @IBOutlet weak var cartUITableView: UITableView!
    
    @IBOutlet weak var totalUILabel: UILabel!
    
    var objects: [CalculatorClass] = []
    
    var newItem: [Any]?
    
    var total: Int? = 0
    
    var oldText: Int?
    
    var totalSum: Int? = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        localization()
        setupData()
        fetchData()
        
    }
 
    @IBAction func unwindToCalculator(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        let totalSection = cartUITableView.numberOfSections
        for section in 0..<totalSection {
            print("section \(section)")
            let totalRows = cartUITableView.numberOfRows(inSection: section)
            for row in 0..<totalRows {
                let cell = cartUITableView.cellForRow(at: IndexPath(row: row, section: section)) as! calculatorTableViewCell
                let txt1 = cell.itemNameUILabel.text
                let txtValue = cell.itemPriceUITextField.text
                if txt1 == newItem?[0] as? String {
                    cartUITableView.beginUpdates()
                    cell.itemPriceUITextField.text = String((newItem?[1] as? Int ?? 0) + (Int(txtValue ?? "0") ?? 0))
                    totalSum? += (newItem?[1] as? Int ?? 0)
                    totalUILabel.text = String(totalSum ?? 0)
                    cartUITableView.endUpdates()
                    return
                }
                
            }
        }
        self.objects.append(CalculatorClass(itemName: self.newItem?[0] as? String ?? "" , itemPrice: self.newItem?[1] as? Int ?? 0))
        cartUITableView.beginUpdates()
        cartUITableView.insertRows(at: [IndexPath(row: objects.count-1, section: 0)], with: .automatic)
        totalSum? += self.newItem?[1] as? Int ?? 0
        self.totalUILabel.text = String(totalSum ?? 0)
        cartUITableView.endUpdates()
    }

}

extension calculatorViewController {
    func setupView() {
        
    }
    
    func localization() {
        
    }
    
    func setupData() {
        self.objects.append(CalculatorClass(itemName: "test", itemPrice: 0))
    }
    
    func fetchData() {
        
    }
}

extension calculatorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: calculatorTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! calculatorTableViewCell
        let obj = objects[indexPath.row]
        cell.itemPriceUITextField.tag = indexPath.row
        cell.btnDelete.tag = indexPath.row
        cell.cartObjects = obj
        cell.calculatorConfigure()
        return cell
    }
}

extension calculatorViewController: UITableViewDelegate {
   
}

extension calculatorViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let totalSection = cartUITableView.numberOfSections
        oldText = 0
        
        for section in 0..<totalSection
        {
            let totalRows = cartUITableView.numberOfRows(inSection: section)
            for row in 0..<totalRows
            {
                let cell = cartUITableView.cellForRow(at: IndexPath(row: row, section: section)) as! calculatorTableViewCell
                let txt1 = cell.itemPriceUITextField.text
                oldText? += Int(txt1 ?? "0") ?? 0
            }
        }
        totalSum = (oldText ?? 0)
        self.totalUILabel.text = String(totalSum ?? 0)
    }
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
