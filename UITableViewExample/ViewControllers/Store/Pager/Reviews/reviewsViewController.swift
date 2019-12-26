//
//  reviewsViewController.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 17/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class reviewsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var objects: [ProductReview] = []
    
    var itemInfo = IndicatorInfo(title: "Reviews")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        localization()
        setupData()
        fetchData()
    }
    
}

extension reviewsViewController {
    func setupView() {
        
        collectionView.register(UINib.init(nibName: "reviewCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "reviewCollectionViewCell")
        
    }
    
    func localization() {
        
    }
    
    func setupData() {
        
    }
    
    func fetchData() {
        let request = BaseRequest()
        let urlExt = "public/api"
        request.url = "\(urlExt)/review/\(Constant.shared.productId)"
        request.method = .get
        
        RequestBuilder.requestWithSuccessFullResponse(request: request) { (json) in
            for item in json["data"].arrayValue {
                self.objects.append(ProductReview(image: item["user"]["avatar"].rawString() ?? "", name: item["user"]["name"].rawString() ?? "", rate: item["i_rate"].doubleValue, reviewText: item["s_review"].rawString() ?? ""))
            }
            self.collectionView.reloadData()
        }
        
    }
}

extension reviewsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reviewCollectionViewCell", for: indexPath) as! reviewCollectionViewCell
        let obj = objects[indexPath.row]
        cell.object = obj
        cell.configureCell()
        return cell
    }
}

extension reviewsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 120
        let width: CGFloat = (UIScreen.main.bounds.size.width - 24)
        return CGSize.init(width: width, height: height)
    }
}

extension reviewsViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}
