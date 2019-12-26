//
//  noteViewController.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 20/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit
import CoreData
import Firebase

class noteViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var noteObjects: [Note] = []
    
    var newItem: [String : Any]?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
        localization()
        fetchData()
    }
    
    @IBAction func btnFireBase(_ sender: Any) {
        var ref: DatabaseReference!

        ref = Database.database().reference()
        
        guard let key = ref.child("TUser").childByAutoId().key else { return }
        
        let dic = ["title": "username", "udid": key]
        
        ref.child("TUser").child(key).setValue(dic) {
             (error:Error?, ref:DatabaseReference) in
             if let error = error {
                print("Data could not be saved: \(error.localizedDescription).")
             } else {
               print("Data saved successfully!")
             }
           }
        
    }
    @IBAction func unwindAddNote(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        let note = TNote(context: Note.context)
        note.title = newItem?["title"] as? String
        note.details = newItem?["details"] as? String
        note.id = Int32(Int.random(in: 0 ... 7))
        Note.saveContext()
        self.noteObjects.append(Note(title: newItem?["title"] as? String ?? "", details: newItem?["details"] as? String ?? ""))
        self.tableView.reloadData()
    }
    
    @IBAction func addNote(_ sender: Any) {
    
//        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "addNewNoteViewController")
//        
//        AppDelegate.shared.rootNavigationViewController?.pushViewController(vc, animated: true)
    }
}

extension noteViewController {
    func setupView() {
        
        tableView.register(UINib.init(nibName: "noteTableViewCell", bundle: nil), forCellReuseIdentifier: "noteTableViewCell")
        
        let fetchRequest: NSFetchRequest<TNote> = TNote.fetchRequest()
        
        do {
            let note = try Note.context.fetch(fetchRequest)
            for nt in note {
                self.noteObjects.append(Note(title: nt.title ?? "", details: nt.details ?? ""))
            }
            self.tableView.reloadData()
        } catch {}
    }
    
    func localization() {
        
    }
    
    func setupData() {
        
    }
    
    func fetchData() {
        
    }
}

extension noteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteTableViewCell", for: indexPath) as! noteTableViewCell
        let obj = noteObjects[indexPath.row]
        cell.objects = obj
        cell.configureCell()
        return cell
    }
    
    
}
