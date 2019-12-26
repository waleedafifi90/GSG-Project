//
//  HomeViewController.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 29/09/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit
import FSPagerView
import SwiftyJSON

class HomeViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    fileprivate let imageNames = ["Demo1","Demo2","Demo3"]
    
    var homeCategoryObject: [HomeCategoryClass] = []
    
    var selectedCategoryItem: Int? = 0
    
    var listObjects: [Product] = []
    
    var currentPage: Int = 1
    
    var categoryID: Int? = 0
    
    @IBOutlet weak var pagerView: FSPagerView! {
        didSet {
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            self.pagerView.itemSize = FSPagerView.automaticSize
        }
    }
    
    @IBOutlet weak var pageControl: FSPageControl! {
        didSet {
            self.pageControl.numberOfPages = self.imageNames.count
            self.pageControl.contentHorizontalAlignment = .center
            self.pageControl.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        localization()
        fetchData()
        setupData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func btnMenu(_ sender: Any) {
        self.showLeftViewAnimated(self)
    }
}

extension HomeViewController {
    func setupView() {
        categoryCollectionView.register(UINib.init(nibName: "productCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "productCollectionViewCell")
        productCollectionView.register(UINib.init(nibName: "HomeCategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCategoryCollectionViewCell")
        if let flowLayout = categoryCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        self.pagerView.automaticSlidingInterval = 3.0
        self.selectedCategoryItem = 0
    }
    
    func localization() {
        
    }
    
    func setupData() {
        
    }
    
    func fetchData() {
        self.homeCategoryObject.removeAll()
        var cat: String = ""
        if categoryID != 0 {
            self.listObjects.removeAll()
            cat = "&category=\(categoryID ?? 0)"
        }
        let request = BaseRequest()
        let urlExt = "public/api"
        request.url = "\(urlExt)/home?page=\(Constant.shared.apiCurrentPage)\(cat)"
        request.method = .get
        
        RequestBuilder.requestWithSuccessFullResponse(request: request) { (json) in
            Constant.shared.apiTotal = json["data"]["product"]["total"].intValue
            Constant.shared.apiPerPage = json["data"]["product"]["per_page"].intValue
            Constant.shared.apiLastPage = json["data"]["product"]["last_page"].intValue
            Constant.shared.apiCurrentPage = json["data"]["product"]["current_page"].intValue
            
            for item in json["data"]["product"]["data"].arrayValue {
                self.listObjects.append(Product(productID: item["id"].intValue, productName: item["s_name"].stringValue, productImage: item["s_featured_image"].stringValue, productRate: 3, productDescription: item["s_description"].stringValue, productPrice: item["d_price"].floatValue, isFav: false,productColor: 1))
            }
            
            for item in json["data"]["category"].arrayValue {
                self.homeCategoryObject.append(HomeCategoryClass.init(id: item["id"].intValue, cellTitle: item["s_name"].stringValue, cellIcon: ""))
            }
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
                self.categoryCollectionView.reloadData()
                self.productCollectionView.reloadData()
            }
        }
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryCollectionView {
            return self.homeCategoryObject.count
        } else {
            return self.listObjects.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCollectionViewCell", for: indexPath) as! productCollectionViewCell
            let obj = homeCategoryObject[indexPath.row]
            cell.indexPath = indexPath
            cell.objects = obj
            cell.configureCell()
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCategoryCollectionViewCell", for: indexPath) as! HomeCategoryCollectionViewCell
            cell.indexPath = indexPath
            cell.objects = listObjects[indexPath.row]
            cell.configureCell()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            if selectedCategoryItem == nil || selectedCategoryItem != indexPath.row {
                self.selectedCategoryItem = indexPath.row
                self.categoryID = homeCategoryObject[indexPath.row].id
                categoryCollectionView.reloadData()
                fetchData()
            } else { }
        } else {
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "pagerViewController")
            Constant.shared.productId = listObjects[indexPath.row].productID ?? 0
            self.show(vc, sender: nil)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            
        } else {
            if indexPath.row == listObjects.count - 1 {
                if listObjects.count < Constant.shared.apiTotal {
                    Constant.shared.apiCurrentPage = Constant.shared.apiCurrentPage + 1
                    self.perform(#selector(loadTable), with: nil, afterDelay: 1.0)
                }
            }
        }
    }
    
    @objc func loadTable() {
        fetchData()
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = UIScreen.main.bounds.size.width - 30
        let height: CGFloat = 125
        return CGSize.init(width: width, height: height)
    }
}

extension HomeViewController: FSPagerViewDataSource,FSPagerViewDelegate {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.imageNames.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage(named: self.imageNames[index])
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.clipsToBounds = true
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.pageControl.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        self.pageControl.currentPage = pagerView.currentIndex
    }
}
