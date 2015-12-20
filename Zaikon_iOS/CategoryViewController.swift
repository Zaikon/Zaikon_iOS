//
//  ViewController.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/04.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    var pageMenu : CAPSPageMenu?
    var controllerArray : [UIViewController] = []
    var categoryStocks = CategoryStocks.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
            
        categoryStocks.fetchCategories { () -> Void in
            
            self.collectViewController()
            let pageMenu = CAPSPageMenu.makeCustomPageMenu(self, controllerArray: self.controllerArray)
            self.addChildViewController(pageMenu)
            self.view.addSubview(pageMenu.view)
            pageMenu.didMoveToParentViewController(self)
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        self.navigationItem.title = "ザイコン"
        self.navigationController!.navigationBar.barTintColor = UIColor.lightBlue()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont(name: "Avenir-Heavy", size: 25)!]
        self.navigationController?.navigationBar.translucent = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectViewController() {
        
        for category in categoryStocks.myCategories {
            let storyBoard = UIStoryboard(name: "SubGoods", bundle: nil)
            let controller = storyBoard.instantiateInitialViewController() as! GoodsCollectionViewController
            controller.title =  category.name
            controller.goodsArray = category.goods
            controller.view.frame = self.view.frame
            controllerArray.append(controller)
        }
    }
}

