//
//  checkoutViewController.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 05/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit
import Braintree
import BraintreeDropIn

class checkoutViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var lblSubTotal: UILabel!
    
    @IBOutlet weak var lblTotal: UILabel!
    
    var objects: [CheckoutClass] = []
    
    var newItems: [Any]?
    
    var old: Int?
    
    var totalPrice: Int?
    
    var subTotal: Int?
    
    var tax: Int? = 10
    
    let clientToken = "sandbox_6mgc52hv_vs22zqzq65c9p6d3"
        
    var braintreeClient: BTAPIClient?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
        localization()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    
    @IBAction func btnCheckout(_ sender: Any) {
//        let request =  BTDropInRequest()
//        let threeDSecure = BTThreeDSecureRequest()
//        threeDSecure.amount = 50.55
//
//           let dropIn = BTDropInController(authorization: clientToken, request: request)
//           { (controller, result, error) in
//               if (error != nil) {
//                   debugPrint("ERROR")
//               } else if (result?.isCancelled == true) {
//                   debugPrint("CANCELLED")
//               } else if let result = result {
//                   // Use the BTDropInResult properties to update your UI
////                    result.paymentOptionType
////                    result.paymentMethod
////                    result.paymentIcon
////                    result.paymentDescription
//
//               }
//               controller.dismiss(animated: true, completion: nil)
//           }
//           self.present(dropIn!, animated: true, completion: nil)
        showDropIn(clientTokenOrTokenizationKey: clientToken)
    }
    
    func showDropIn(clientTokenOrTokenizationKey: String) {
        
        let request = BTDropInRequest()
        request.threeDSecureVerification = true

        let threeDSecureRequest = BTThreeDSecureRequest()
        threeDSecureRequest.amount = 10.00
        threeDSecureRequest.email = "test@email.com"
        threeDSecureRequest.versionRequested = .version2

        let address = BTThreeDSecurePostalAddress()
        address.givenName = "Jill" // ASCII-printable characters required, else will throw a validation error
        address.surname = "Doe" // ASCII-printable characters required, else will throw a validation error
        address.phoneNumber = "5551234567"
        address.streetAddress = "555 Smith St"
        address.extendedAddress = "#2"
        address.locality = "Chicago"
        address.region = "IL"
        address.postalCode = "12345"
        address.countryCodeAlpha2 = "US"
        threeDSecureRequest.billingAddress = address

        // Optional additional information.
        // For best results, provide as many of these elements as possible.
        let info = BTThreeDSecureAdditionalInformation()
        info.shippingAddress = address
        threeDSecureRequest.additionalInformation = info

        let dropInRequest = BTDropInRequest()
        dropInRequest.threeDSecureVerification = true
        dropInRequest.threeDSecureRequest = threeDSecureRequest

        let dropIn = BTDropInController(authorization: self.clientToken, request: dropInRequest) { (controller, result, error) in
            if (error != nil) {
                debugPrint(error?.localizedDescription)
            } else if (result?.isCancelled == true) {
                debugPrint("Cancel Clicked")
            } else {
                debugPrint(result?.paymentMethod?.nonce)
            }
            controller.dismiss(animated: true, completion: nil)
        }
        self.present(dropIn!, animated: true, completion: nil)
        
//        let request =  BTDropInRequest()
//        request.threeDSecureVerification = true
//        request.threeDSecureRequest?.amount = 50.55
//        let dropIn = BTDropInController(authorization: clientTokenOrTokenizationKey, request: request)
//        { (controller, result, error) in
//            if (error != nil) {
//                print("ERROR")
//            } else if (result?.isCancelled == true) {
//                print("CANCELLED")
//            } else if let result = result {
//                // Use the BTDropInResult properties to update your UI
//                // result.paymentOptionType
//                // result.paymentMethod
//                // result.paymentIcon
//                // result.paymentDescription
//            }
//            controller.dismiss(animated: true, completion: nil)
//        }
//        self.present(dropIn!, animated: true, completion: nil)
    }
    
    @IBAction func unwindToCheckout(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
//        self.objects.append(CheckoutClass(productCheckoutImage: "String", productCheckoutName: self.newItems?[0] as? String ?? "", productCheckoutSize: self.newItems?[4] as? String ?? "", productCheckoutCode: randomString(length: 8), productCheckoutColor: self.newItems?[3] as? String ?? "", productCheckoutPrice: self.newItems?[1] as? Int ?? 0, productCheckoutQuantity: self.newItems?[5] as? String ?? "0"))
        
        tableView.beginUpdates()
            var newValue: Int = 0
            let totalSection = self.tableView.numberOfSections
            for section in 0..<totalSection
            {
                let totalRows = self.tableView.numberOfRows(inSection: section)
                for row in 0..<totalRows
                {
                    let cell = self.tableView.cellForRow(at: IndexPath(row: row, section: section)) as! checkoutTableViewCell
                    let txt1: Int = (Int(cell.productCheckoutPrice.text ?? "0") ?? 0) * (Int(cell.productCheckoutQuantity.text ?? "0") ?? 0)
                    newValue += txt1
                    cell.productCheckoutSubtotal.text = String(txt1)
                }
            }
            self.subTotal = newValue + (self.tax ?? 0)
            self.totalPrice = newValue
            self.lblSubTotal.text = String(newValue)
            self.lblTotal.text = String(newValue + (self.tax ?? 0))

        
        tableView.insertRows(at: [IndexPath(row: objects.count-1, section: 0)], with: .automatic)
        tableView.endUpdates()
    }
    
    func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
}

extension checkoutViewController {
    func setupView() {
        tableView.register(UINib.init(nibName: "checkoutTableViewCell", bundle: nil), forCellReuseIdentifier: "checkoutTableViewCell")
        
        self.lblSubTotal.text = String(subTotal ?? 0)
        
        self.lblTotal.text = String(totalPrice ?? 0)
    }
    
    func localization() {
    }
    
    func setupData() {
    }
    
    func fetchData() {
        let request = BaseRequest()
        let urlExt = "public/api"
        request.url = "\(urlExt)/cart/\(UserProfile.shared.userID ?? "0")"
        request.method = .get
        
        RequestBuilder.requestWithSuccessFullResponse(request: request) { (json) in
            for item in json["data"].arrayValue {
                self.objects.append(CheckoutClass(cartID: item["cartID"].intValue, productCheckoutImage: item["s_featured_image"].stringValue, productCheckoutName: item["s_name"].stringValue, productCheckoutSize: item["product_size"].stringValue, productCheckoutCode: self.randomString(length: 8), productCheckoutColor: item["product_color"].stringValue, productCheckoutPrice: item["d_price"].intValue, productCheckoutQuantity: item["quantity"].stringValue))
            }
            self.tableView.reloadData()
        }
    }
}

extension checkoutViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "checkoutTableViewCell", for: indexPath) as! checkoutTableViewCell
        let obj = objects[indexPath.row]
        cell.indexPath = indexPath
        cell.object = obj
        cell.configureCheckout()
        return cell
    }
}

extension checkoutViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let totalSection = tableView.numberOfSections
        for section in 0..<totalSection
        {
            let totalRows = tableView.numberOfRows(inSection: section)
            for row in 0..<totalRows
            {
                let cell = tableView.cellForRow(at: IndexPath(row: row, section: section)) as! checkoutTableViewCell
                let txt1: Int = (Int(cell.productCheckoutPrice.text ?? "0") ?? 0) * (Int(cell.productCheckoutQuantity.text ?? "0") ?? 0)
                self.totalPrice? += txt1
                print(totalPrice)
            }
        }
        self.lblTotal.text = String(totalPrice ?? 0)
    }
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

