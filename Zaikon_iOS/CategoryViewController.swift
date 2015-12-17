//
//  ViewController.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/04.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit
import Alamofire // Alamofireをimport
import SwiftyJSON

class CategoryViewController: UIViewController {
    var pageMenu : CAPSPageMenu?
    var categories: [String?] = []
    var controllerArray : [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // app title
        self.title = "ザイコン"
        
        //get category
        fetchCategories { () -> Void in
            self.collectViewController()
            let pageMenu = self.makePageMenu()
            self.addChildViewController(pageMenu!)
            self.view.addSubview(pageMenu!.view)
            pageMenu!.didMoveToParentViewController(self)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.navigationBar.barTintColor = UIColor.lightBlue()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont(name: "Avenir-Heavy", size: 25)!]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func fetchCategories(callback: () -> Void ) {
        Alamofire.request(.GET, "http://localhost:3000/api/categories")
            .responseJSON { response in
                guard let object = response.result.value else {
                    print("You should check your network connection")
                    return
                }
                
                let categoriesJSON = JSON(object)
                categoriesJSON["categories"].forEach { (_, json) in
                    let category = json["name"].string
                    self.categories.append(category)
                }
                callback()
                
        }
    }
    
    func collectViewController() {
        for category in self.categories {
            let controller :GoodsViewController = GoodsViewController()
            controller.title = category!
            controller.view.frame = self.view.frame
            controllerArray.append(controller)
        }
    }
    
    func makePageMenu() ->  CAPSPageMenu? {
        let navBarHeight = self.navigationController?.navigationBar.frame.size.height
        let statusBarHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.height
        
        let arrayNum = controllerArray.count
        let menuWidth = self.view.frame.width / CGFloat(arrayNum)
        let parameters: [CAPSPageMenuOption] = [
            .ScrollMenuBackgroundColor(UIColor.whiteColor()),
            .SelectedMenuItemLabelColor(UIColor.lightBlue()),
            .ViewBackgroundColor(UIColor.lightGrey()),
            .SelectionIndicatorColor(UIColor.lightBlue()),
            .SelectedMenuItemLabelColor(UIColor.lightBlue()),
            .UnselectedMenuItemLabelColor(UIColor.blackColor()),
            .MenuItemFont(UIFont(name: "Avenir-Heavy", size: 13.0)!),
            .MenuHeight(30.0),
            .MenuItemWidth(menuWidth),
            .MenuMargin(0.0),
            .CenterMenuItems(true),
        ]
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, CGFloat(navBarHeight!) + statusBarHeight, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        return pageMenu
    }
    
}

