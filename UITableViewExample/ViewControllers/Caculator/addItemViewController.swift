//
//  addItemViewController.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 22/09/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import Foundation
import UIKit
import IQKeyboardManagerSwift

class addItemViewController: UIViewController {

    @IBOutlet weak var itemName: UITextField!
    
    @IBOutlet weak var itemPrice: UITextField!
    
    @IBOutlet weak var formView: UIView!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        localization()
        setupData()
        fetchData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindToCalculator" {
            if let vc = segue.destination as? calculatorViewController {
                vc.newItem = sender as? [Any]
            }
        }
    }
    
    @IBAction func addToCart(_ sender: Any) {
        if itemName?.text == "" ||  itemName?.text?
            .count == 0 {
            showAlertPopUp(title: "Item Name Error", message: "Name must start with Charachter", buttonAction1: {
                
            }) {
            
            }
            return
        }
        if itemPrice.text?.isInt == false {
            showAlertPopUp(title: "Price Error", message: "Price must be number!", buttonAction1: {
                
            }) {
            
            }
            return
        }
        self.performSegue(withIdentifier: "unwindToCalculator", sender: [itemName?.text, Int(itemPrice?.text ?? "0")])
    }
    
    
    @IBAction func dismissViewController(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension addItemViewController {
    func setupView() {
        formView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        cancelButton.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]

    }

    func localization() {
        
    }

    func setupData() {

    }

    func fetchData() {
        
    }
}

