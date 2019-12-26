//
//  relatedItemsViewController.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 17/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class relatedItemsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var object: [Product] = []
    
    var itemInfo = IndicatorInfo(title: "Related Items")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        localization()
        setupData()
        fetchData()
        // Do any additional setup after loading the view.
    }
}

extension relatedItemsViewController {
    func setupView() {
        collectionView.register(UINib.init(nibName: "HomeCategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCategoryCollectionViewCell")
    }
    
    func localization() {
        
    }
    
    func setupData() {
        
    }
    
    func fetchData() {
        let request = BaseRequest()
        let urlExt = "public/api"
        request.url = "\(urlExt)/related_product/\(Constant.shared.productId)"
        request.method = .get
        
        RequestBuilder.requestWithSuccessFullResponse(request: request) { (json) in
            for item in json["data"].arrayValue {
                self.object.append(Product(productID: item["id"].intValue, productName: item["s_name"].stringValue, productImage: item["s_featured_image"].stringValue, productRate: 5, productDescription: item["s_description"].stringValue, productPrice: item["d_price"].floatValue, isFav: false, productColor: 1))
            }
            self.collectionView.reloadData()
        }
    }
}

extension relatedItemsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.object.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCategoryCollectionViewCell", for: indexPath) as! HomeCategoryCollectionViewCell
        let obj = object[indexPath.row]
        cell.objects = obj
        cell.configureCell()
        return cell
    }
    
}

extension relatedItemsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 125
        let width: CGFloat = UIScreen.main.bounds.size.width - 24
        return CGSize.init(width: width, height: height)
        
    }
}

extension relatedItemsViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}
