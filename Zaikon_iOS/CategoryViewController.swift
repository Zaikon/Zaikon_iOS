//
//  ViewController.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/04.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    let lightBlue = UIColor(red: 75/255, green: 199/255, blue: 241/255, alpha: 1)
    let lightGrey = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
    var pageMenu : CAPSPageMenu?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // app title
        self.title = "ザイコン"
        let navBarHeight = self.navigationController?.navigationBar.frame.size.height
        let statusBarHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.height
        
        var controllerArray : [UIViewController] = []
        
        let controller1 :GoodsViewController = GoodsViewController(nibName: "GoodsViewController", bundle: nil)
        controller1.title = "ドリンク"
        controllerArray.append(controller1)
        
        let controller2 :GoodsViewController = GoodsViewController(nibName: "GoodsViewController", bundle: nil)
        controller2.title = "食べ物"
        controllerArray.append(controller2)
        
        let controller3 :GoodsViewController = GoodsViewController(nibName: "GoodsViewController", bundle: nil)
        controller3.title = "その他"
        controllerArray.append(controller3)
        
        let arrayNum = controllerArray.count
        let menuWidth = self.view.frame.width / CGFloat(arrayNum)
        let parameters: [CAPSPageMenuOption] = [
            .ScrollMenuBackgroundColor(UIColor.whiteColor()),
            .SelectedMenuItemLabelColor(lightBlue),
            .ViewBackgroundColor(lightGrey),
            .SelectionIndicatorColor(lightBlue),
            .SelectedMenuItemLabelColor(lightBlue),
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
        self.navigationController!.navigationBar.barTintColor = lightBlue
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont(name: "Chalkduster", size: 25)!]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

