//
//  itemDetailsViewController.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 17/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class itemDetailsViewController: UIViewController {
    
    @IBOutlet weak var colorCollection: UICollectionView!
    
    @IBOutlet weak var sizeCollection: UICollectionView!
    
    @IBOutlet weak var txtProductName: UILabel!
    
    @IBOutlet weak var txtPrice: UILabel!
    
    @IBOutlet weak var txtDescription: UILabel!
    
    @IBOutlet weak var imageCollection: UICollectionView!
    
    var itemInfo = IndicatorInfo(title: "Product Details")
    
    var colorObject: [ProductColor] = []
    
    var sizeObject: [ProductSize] = []
    
    var imageObject: [ProductImages] = []
    
    var selectedColor: Int? = 1
    
    var selectedSize: Int? = 1
    
    override func viewDidLoad() {
        setupView()
        localization()
        setupData()
        fetchData()
        super.viewDidLoad()
        
    }
    
    @IBAction func btnAddToCart(_ sender: Any) {
        if let userID = UserProfile.shared.userID {
            let request = BaseRequest()
            let urlExt = "public/api"
            request.url = "\(urlExt)/cart"
            request.method = .post
            request.parameters = [
                "product_id": Constant.shared.productId,
                "user_id": userID,
                "product_color": colorObject[selectedColor ?? 0].colorName ?? "white",
                "product_size": sizeObject[selectedSize ?? 0].s_name ?? "s",
                "quantity": "1"
            ]
            RequestBuilder.requestWithSuccessFullResponse(request: request, showLoader: true, showErrorMessage: true) { (json) in
                debugPrint(json)
            }
        }
    }
    
}

extension itemDetailsViewController {
    func setupView() {
        colorCollection.register(UINib.init(nibName: "colorFillterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "colorFillterCollectionViewCell")
        
        sizeCollection.register(UINib.init(nibName: "filtterSizeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "filtterSizeCollectionViewCell")
        
        imageCollection.register(UINib.init(nibName: "productImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "productImageCollectionViewCell")
    }
    
    func localization() {
        
    }
    
    func setupData() {
        
    }
    
    func fetchData() {
        let request = BaseRequest()
        let urlExt = "public/api"
        request.url = "\(urlExt)/products/\(Constant.shared.productId)"
        request.method = .get
        
        RequestBuilder.requestWithSuccessFullResponse(request: request) { (json) in
            self.txtProductName.text = json["data"]["s_name"].rawString()
            self.txtPrice.text = json["data"]["d_price"].rawString()
            self.txtDescription.text = json["data"]["s_description"].rawString()
            
            for item in json["data"]["product_colors"].arrayValue {
                self.colorObject.append(ProductColor(colorID: item["id"].intValue, colorName: item["s_name"].rawString() ?? "", colorHex: item["s_hex"].rawString() ?? ""))
            }
            
            for item in json["data"]["size"].arrayValue {
                self.sizeObject.append(ProductSize(product_id: item["product_id"].intValue, s_name: item["s_name"].stringValue))
            }
            
            for item in json["data"]["product_images"].arrayValue {
                self.imageObject.append(ProductImages(product_id: item["id"].intValue, s_alt: item["s_alt"].stringValue, s_image: item["s_image"].stringValue, i_status: item["i_status"].intValue))
            }
            self.colorCollection.reloadData()
            self.sizeCollection.reloadData()
            self.imageCollection.reloadData()
        }
    }
}

extension itemDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == colorCollection {
            return colorObject.count
        } else if collectionView == imageCollection {
            return imageObject.count
        } else {
            return sizeObject.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == colorCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colorFillterCollectionViewCell", for: indexPath) as! colorFillterCollectionViewCell
            let obj = self.colorObject[indexPath.row]
            cell.indexPath = indexPath
            cell.object = obj
            cell.configureColorCell()
            return cell
        } else if collectionView == imageCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productImageCollectionViewCell", for: indexPath) as! productImageCollectionViewCell
            let obj = self.imageObject[indexPath.row]
            cell.object = obj
            cell.configureCell()
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filtterSizeCollectionViewCell", for: indexPath) as! filtterSizeCollectionViewCell
            let obj = self.sizeObject[indexPath.row]
            cell.object = obj
            cell.configureCell()
            return cell
        }
    }
}

extension itemDetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == imageCollection {
            if indexPath.row == 0 {
                let height: CGFloat = 300.0
                let width: CGFloat = UIScreen.main.bounds.size.width
                return CGSize.init(width: width, height: height)
            } else {
                let height: CGFloat = 120.0
                let width: CGFloat = (UIScreen.main.bounds.size.width - 44) / 3
                return CGSize.init(width: width, height: height)
            }
        } else if collectionView == colorCollection {
            let height: CGFloat = 50
            let width: CGFloat = 50
            return CGSize.init(width: width, height: height)
        } else {
            let height: CGFloat = 50
            let width: CGFloat = 50
            return CGSize.init(width: width, height: height)
        }
    }
}

extension itemDetailsViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}
