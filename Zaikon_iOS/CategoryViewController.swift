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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // app title
        self.title = "ザイコン"
        let navBarHeight = self.navigationController?.navigationBar.frame.size.height
        let statusBarHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.height
        
        var controllerArray : [UIViewController] = []
        
        let controller1 :GoodsViewController = GoodsViewController()
        controller1.title = "ドリンク"
        controller1.view.frame = self.view.frame
        controllerArray.append(controller1)
        print("CategoryViewController")
        print(self.view.frame)
        print("GoodsViewController")
        print(controller1.view.frame)
    
        
//        let controller2 :GoodsViewController = GoodsViewController(nibName: "GoodsViewController", bundle: nil)
//        controller2.title = "食べ物"
//        controller2.view.frame = self.view.frame
//        controllerArray.append(controller2)
//        
//        let controller3 :GoodsViewController = GoodsViewController(nibName: "GoodsViewController", bundle: nil)
//        controller3.title = "その他"
//        controller3.view.frame = self.view.frame
//        controllerArray.append(controller3)
        
        let arrayNum = controllerArray.count
        let menuWidth = self.view.frame.width / CGFloat(arrayNum)
        let parameters: [CAPSPageMenuOption] = [
            .ScrollMenuBackgroundColor(UIColor.whiteColor()),
            .SelectedMenuItemLabelColor(UIColor.lightBlue()),
            .ViewBackgroundColor(UIColor.lightGrey()),
            .SelectionIndicatorColor(UIColor.lightBlue()),
            .SelectedMenuItemLabelColor(UIColor.lightBlue()),
            .UnselectedMenuItemLabelColor(UIColor.blackColor()),
            .MenuItemFont(UIFont(name: "Chalkduster", size: 13.0)!),
            .MenuHeight(30.0),
            .MenuItemWidth(menuWidth),
            .MenuMargin(0.0),
            .CenterMenuItems(true),
        ]
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, CGFloat(navBarHeight!) + statusBarHeight, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        
        
        self.addChildViewController(pageMenu!)
        self.view.addSubview(pageMenu!.view)
        
        pageMenu!.didMoveToParentViewController(self)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.navigationBar.barTintColor = UIColor.lightBlue()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont(name: "Chalkduster", size: 25)!]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

