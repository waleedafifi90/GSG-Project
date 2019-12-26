//
//  categoryViewController.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 26/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit

class categoryViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var categoryObjects: [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        localization()
        setupData()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
}

extension categoryViewController {
    func setupView() {
        collectionView.register(UINib.init(nibName: "categoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "categoryCollectionViewCell")
        
    }
    
    func localization() { }
    
    func setupData() {
//        categoryObjects.append(Category(categoryImage: "category1", categoryName: "Dresses"))
//        categoryObjects.append(Category(categoryImage: "category2", categoryName: "Bags"))
//        categoryObjects.append(Category(categoryImage: "category3", categoryName: "Hats"))
//        categoryObjects.append(Category(categoryImage: "category4", categoryName: "Cardigans"))
//        categoryObjects.append(Category(categoryImage: "category5", categoryName: "Jackets"))
//        categoryObjects.append(Category(categoryImage: "category6", categoryName: "Bouses"))
    }
    
    func fetchData() {
        let request = BaseRequest()
        let urlExt = "public/api"
        request.url = "\(urlExt)/category"
        request.method = .get
        
        RequestBuilder.requestWithSuccessFullResponse(request: request) { (json) in
            for item in json["data"].arrayValue {
                self.categoryObjects.append(Category(categoryID: item["id"].intValue, categoryImage: item["s_image"].stringValue, categoryName: item["s_name"].stringValue))
                self.collectionView.reloadData()
            }
        }
    }
}

extension categoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryObjects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCollectionViewCell", for: indexPath) as! categoryCollectionViewCell
        let obj = categoryObjects[indexPath.row]
        cell.objects = obj
        cell.configureCell()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "productsListViewController") as! productsListViewController
        vc.categoryID = categoryObjects[indexPath.row].categoryID ?? 0
        AppDelegate.shared.rootNavigationViewController.pushViewController(vc, animated: true)
    }
}

extension categoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 100
        let width: CGFloat = UIScreen.main.bounds.size.width - 24
        return CGSize.init(width: width, height: height)
    }
}
