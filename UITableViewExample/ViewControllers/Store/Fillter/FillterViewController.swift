//
//  FillterViewController.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 16/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit
import RangeSeekSlider

class FillterViewController: UIViewController {
    
    @IBOutlet weak var sizeCollectionView: UICollectionView!
    
    @IBOutlet weak var colorCollectionView: UICollectionView!
    
    @IBOutlet weak var priceRangeSlider: RangeSeekSlider!
    
    @IBOutlet weak var lblMiniPrice: UILabel!
    
    @IBOutlet weak var lblMaxPrice: UILabel!
    
    @IBOutlet weak var txtKeyword: UITextField!
    
    var colorObject: [filterColor] = []
    
    var sizeObject: [Filtersize] = []
    
    var priceRange: [String : CGFloat] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupView()
        fetchData()
        localization()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func btnSearch(_ sender: Any) {
        Constant.shared.color?.removeAll()
        let totalRows = self.colorCollectionView.numberOfItems(inSection: 0)
        for row in 0..<totalRows
        {
            let cell = self.colorCollectionView.cellForItem(at: IndexPath(row: row, section: 0)) as! colorFillterCollectionViewCell
            if cell.fillterColorCheckBook.on == true {
                Constant.shared.color?.append(row)
            }
        }
        Constant.shared.priceRange = self.priceRange
        Constant.shared.productName = self.txtKeyword.text
        Constant.shared.isDefualtConstant = false
        
        
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "productsListViewController")
        AppDelegate.shared.rootNavigationViewController?.pushViewController(vc, animated: true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension FillterViewController {
    func setupView() {
        colorCollectionView.register(UINib.init(nibName: "colorFillterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "colorFillterCollectionViewCell")
        
        sizeCollectionView.register(UINib.init(nibName: "filtterSizeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "filtterSizeCollectionViewCell")
    }
    
    func localization() {
        
    }
    
    func setupData() {
        
        priceRangeSlider.delegate = self
        priceRangeSlider.numberFormatter.maximumFractionDigits = 0
        priceRangeSlider.numberFormatter.numberStyle = .none
        
//        if Constant.shared.priceRange.count > 0 {
//            priceRangeSlider.minValue = Constant.shared.priceRange["minValue"] ?? 0
//            priceRangeSlider.maxValue = Constant.shared.priceRange["maxValue"] ?? 0
//        }
        
//        colorObject.append(filterColor.Blue_Bell)
//        colorObject.append(filterColor.Chestnut_Rose)
//        colorObject.append(filterColor.Jagged_Ice)
//        colorObject.append(filterColor.Puerto_Rico)
//        colorObject.append(filterColor.Rajah)
//        colorObject.append(filterColor.All)
        
        sizeObject.append(Filtersize.xs)
        sizeObject.append(Filtersize.s)
        sizeObject.append(Filtersize.m)
        sizeObject.append(Filtersize.l)
        sizeObject.append(Filtersize.xl)
        sizeObject.append(Filtersize.xxl)
        sizeObject.append(Filtersize.all)
    }
    
    func fetchData() {
        
    }
}

extension FillterViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView == colorCollectionView {
//            return colorObject.count
//        } else {
            return sizeObject.count
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == colorCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colorFillterCollectionViewCell", for: indexPath) as! colorFillterCollectionViewCell
//            let obj = self.colorObject[indexPath.row]
//            cell.indexPath = indexPath
//            cell.object = obj
//            cell.configureColorCell()
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filtterSizeCollectionViewCell", for: indexPath) as! filtterSizeCollectionViewCell
            let obj = self.sizeObject[indexPath.row]
//            cell.object = obj
            cell.configureCell()
            return cell
        }
        
    }
}

extension FillterViewController: RangeSeekSliderDelegate {
    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {
        if slider == priceRangeSlider {
            self.lblMaxPrice.text = "\(round(maxValue))"
            
            self.lblMiniPrice.text = "\(round(minValue))"
            
            self.priceRange = ["minValue" : minValue, "maxValue" : maxValue]
        }
    }
}
