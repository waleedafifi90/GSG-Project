//
//  addNewNoteViewController.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 21/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit
import Firebase

class addNewNoteViewController: UIViewController {

    @IBOutlet weak var lblTitle: UITextView!
    
    @IBOutlet weak var lblDetails: UITextView!
    
    var senderDic: [String : Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "unwindAddNote" {
            
            let vc = segue.destination as? noteViewController
            
            vc?.newItem = sender as? [String : Any]
        }
    }
    
    @IBAction func btnSave(_ sender: Any) {
        
        senderDic = ["title" : lblTitle.text, "details" : lblDetails.text]
       
        self.performSegue(withIdentifier: "unwindAddNote", sender: senderDic)
    }
    
    @IBAction func btnCancel(_ sender: Any) {
        
        self.performSegue(withIdentifier: "unwindAddNote", sender: nil)
    }
}
