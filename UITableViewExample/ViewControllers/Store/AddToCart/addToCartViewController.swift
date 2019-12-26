//
//  addToCartViewController.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 06/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit

class addToCartViewController: UIViewController {

    @IBOutlet weak var txtProductName: UITextField!
    
    @IBOutlet weak var txtProductPrice: UITextField!
    
    @IBOutlet weak var txtProductQuantity: UITextField!
        
    @IBOutlet weak var pickerColor: UIPickerView!
    
    @IBOutlet weak var sizePicker: UIPickerView!
    
    var selectedColor: String?
    
    var selectedSize: String?
    
    var colorObject: [filterColor] = []
    
    var sizeObject: [Filtersize] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        localization()
        setupData()
        fetchData()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindToCheckout" {
            if let vc = segue.destination as? checkoutViewController {
                vc.newItems = sender as? [Any]
            }
        }
    }
    
    @IBAction func btnAddToCart(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindToCheckout", sender: [txtProductName?.text ?? "test", Int(txtProductPrice?.text ?? "0") ?? 0, "nil", selectedColor, selectedSize, txtProductQuantity?.text])
        
    }

}

extension addToCartViewController {
    func setupView() { }
    
    func localization() { }
    
    func setupData() {
        colorObject.append(filterColor.Blue_Bell)
        colorObject.append(filterColor.Chestnut_Rose)
        colorObject.append(filterColor.Jagged_Ice)
        colorObject.append(filterColor.Puerto_Rico)
        colorObject.append(filterColor.Rajah)
        colorObject.append(filterColor.All)
        
        sizeObject.append(Filtersize.xs)
        sizeObject.append(Filtersize.s)
        sizeObject.append(Filtersize.m)
        sizeObject.append(Filtersize.l)
        sizeObject.append(Filtersize.xl)
        sizeObject.append(Filtersize.xxl)
        sizeObject.append(Filtersize.all)
    }
    
    func fetchData() { }
}

extension addToCartViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickerColor {
            return self.colorObject.count
        } else {
            return self.sizeObject.count
        }
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickerColor {
            selectedColor = colorObject[row].colorHex
            return self.colorObject[row].name
        } else {
            selectedSize = sizeObject[row].sizeName
            return self.sizeObject[row].sizeName
        }
    }
    
}
