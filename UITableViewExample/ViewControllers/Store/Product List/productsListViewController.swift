//
//  productsListViewController.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 03/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit
import SwiftyJSON

class productsListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!

    var listObjects: [Product] = []
    
    var categoryID: Int = 0
    
    enum viewType {
        case grid, list
    }
    
    var type: viewType = .grid {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
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
    
    @IBAction func btnGridView(_ sender: Any) {
        self.type = .grid
    }
    
    @IBAction func btnListView(_ sender: Any) {
        self.type = .list
    }
    
}

extension productsListViewController {
    func setupView() {
        collectionView.register(UINib.init(nibName: "productGridCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "productGridCollectionViewCell")
        
        collectionView.register(UINib.init(nibName: "HomeCategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCategoryCollectionViewCell")
        self.type = .grid
        
    }
    
    func localization() {
        
    }
    
    func setupData() {
        
        let request = BaseRequest()
        let urlExt = "public/api"
        request.url = "\(urlExt)/category/\(String(categoryID))"
        request.method = .get
        
        RequestBuilder.requestWithSuccessFullResponse(request: request) { (json) in
            for item in json["data"]["product"].arrayValue {
                self.listObjects.append(Product(productID: item["id"].intValue, productName: item["s_name"].stringValue, productImage: item["s_featured_image"].stringValue, productRate: 3, productDescription: item["s_description"].stringValue, productPrice: item["d_price"].floatValue, isFav: false,productColor: 1))
            }
            self.collectionView.reloadData()
        }
        collectionView.reloadData()
    }
    
    func fetchData() {
        
    }
}

extension productsListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listObjects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch type {
        case .grid:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productGridCollectionViewCell", for: indexPath) as! productGridCollectionViewCell
            let obj = listObjects[indexPath.row]
            cell.objects = obj
            cell.configureCell()
            return cell
        case .list:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCategoryCollectionViewCell", for: indexPath) as! HomeCategoryCollectionViewCell
            let obj = listObjects[indexPath.row]
            cell.objects = obj
            cell.configureCell()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "pagerViewController")
        Constant.shared.productId = listObjects[indexPath.row].productID ?? 0
        self.show(vc, sender: nil)
    }
}

extension productsListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch type {
        case .grid:
            let width: CGFloat = (UIScreen.main.bounds.size.width - 45) / 2
            let height: CGFloat = width * (300 / 170.5)
            return CGSize.init(width: width, height: height)
        case .list:
            let height: CGFloat = 125
            let width: CGFloat = UIScreen.main.bounds.size.width - 30
            return CGSize.init(width: width, height: height)
        }
    }
    
}
