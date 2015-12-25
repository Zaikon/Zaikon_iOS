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
    var categoryStocks = CategoryStocks.sharedCategory
    
    var currenUser = CurrentUser.sharedCurrentUser

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
        let backButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
//        let titleImageView = setNavigationImageView()

        
        navigationItem.backBarButtonItem = backButtonItem
//        navigationItem.titleView = titleImageView
        navigationController!.navigationBar.barTintColor = UIColor.lightBlue()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont(name: "Avenir-Heavy", size: 25)!]
        navigationController?.navigationBar.translucent = true
        
        categoryStocks.fetchCategories { () -> Void in
            print("Hoge")
        }
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
    
//    func setNavigationImageView() -> UIImageView {
//        let titleImageView = UIImageView(image: UIImage(named: "zaicon_skeleton_icon"))
//        titleImageView.frame.size = CGSizeMake(10, 10)
//        titleImageView.center.x = self.view.center.x
//        titleImageView.frame.origin.y = 20
//        return titleImageView
//    }
}

