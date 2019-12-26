//
//  leftMenuViewController.swift
//  UITableViewExample
//
//  Created by Waleed Afifi on 26/10/2019.
//  Copyright © 2019 Waleed Afifi. All rights reserved.
//

import UIKit
import CoreData
import SDWebImage

class leftMenuViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var txtUsername: UILabel!
    
    @IBOutlet weak var txtAddress: UILabel!
    
    @IBOutlet weak var imgAvatar: UIImageView!
    
    
    
    enum leftMenu {
        case home, userProfile, products, wishlist, shoppingCart, sendGift, category, useQRCode, settings, privacyPolicy, aboutUs, logout, login
        
        var name: String {
            switch self {
            case .home:
                return "Home"
            case .category:
                return "Category"
            case .products:
                return "Product Filter"
            case .userProfile:
                return "User Profile"
            case .logout:
                return "Logout"
            case .wishlist:
                return "Wishlist"
            case .shoppingCart:
                return "Shopping Cart"
            case .sendGift:
                return "Send Gift"
            case .useQRCode:
                return "Use QR code"
            case .settings:
                return "Settings"
            case .privacyPolicy:
                return "Privacy Policy"
            case .aboutUs:
                return "About Us"
            case .login:
                return "Login"
            }
        }
        
        var icon: String {
            switch self {
            case .home:
                return "icHome"
            case .category:
                return "icCategory"
            case .products:
                return "icProductFilter"
            case .userProfile:
                return "icMyAccount"
            case .logout:
                return "icLogout"
            case .wishlist:
                return "icWishlist"
            case .shoppingCart:
                return "icShoppingCart"
            case .sendGift:
                return "icGift"
            case .useQRCode:
                return "icQR"
            case .settings:
                return "icSettings"
            case .privacyPolicy:
                return "icPolicy"
            case .aboutUs:
                return "icAbout"
            case .login:
                return "icLogout"
            }
        }
    }
    
    var menuObject: [Menu] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        localization()
        setupData()
        fetchData()
    }
    
}

extension leftMenuViewController {
    func setupView() {
        tableView.register(UINib.init(nibName: "sideMenuTableViewCell", bundle: nil), forCellReuseIdentifier: "sideMenuTableViewCell")
    }
    
    func localization() { }
    
    func setupData() {
        menuObject.append(Menu(icon: leftMenu.home.icon, label: leftMenu.home.name))
        menuObject.append(Menu(icon: leftMenu.userProfile.icon, label: leftMenu.userProfile.name))
        menuObject.append(Menu(icon: leftMenu.products.icon, label: leftMenu.products.name))
        menuObject.append(Menu(icon: leftMenu.wishlist.icon, label: leftMenu.wishlist.name))
        menuObject.append(Menu(icon: leftMenu.shoppingCart.icon, label: leftMenu.shoppingCart.name))
        menuObject.append(Menu(icon: leftMenu.sendGift.icon, label: leftMenu.sendGift.name))
        menuObject.append(Menu(icon: leftMenu.category.icon, label: leftMenu.category.name))
        menuObject.append(Menu(icon: leftMenu.useQRCode.icon, label: leftMenu.useQRCode.name))
        menuObject.append(Menu(icon: leftMenu.settings.icon, label: leftMenu.settings.name))
        menuObject.append(Menu(icon: leftMenu.privacyPolicy.icon, label: leftMenu.privacyPolicy.name))
        menuObject.append(Menu(icon: leftMenu.aboutUs.icon, label: leftMenu.aboutUs.name))
        menuObject.append(Menu(icon: leftMenu.logout.icon, label: leftMenu.logout.name))
        menuObject.append(Menu(icon: leftMenu.login.icon, label: leftMenu.login.name))
    }
    
    func fetchData() {
        let fetchRequest: NSFetchRequest<TUser> = TUser.fetchRequest()
        
        do {
            let user = try User.context.fetch(fetchRequest)
            for nt in user {
                txtUsername.text = nt.username ?? ""
                txtAddress.text = nt.address ?? ""
                imgAvatar.sd_setImage(with: URL(string: nt.avatar ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
            }
        } catch {}
    }
}

extension leftMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuObject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sideMenuTableViewCell", for: indexPath) as! sideMenuTableViewCell
        let obj = menuObject[indexPath.row]
        cell.objects = obj
        cell.configureCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "userProfileViewController")
            self.show(vc, sender: nil)
        } else if indexPath.row == 2 {
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "FillterViewController")
            self.show(vc, sender: nil)
        } else if indexPath.row == 4 {
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "checkoutViewController")
            self.show(vc, sender: nil)
        } else if indexPath.row == 6 {
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "categoryViewController")
            self.show(vc, sender: nil)
        } else if indexPath.row == 11 {
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "authenticationViewController")
            UserProfile.shared.accessToken = nil
            UserProfile.shared.userID = nil
            self.show(vc, sender: nil)
        }
    }
}
