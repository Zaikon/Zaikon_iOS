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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // app title
        self.title = "ザイコン"
        
        // set initial methods
        self.view.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        
        var controllerArray : [UIViewController] = []
        
        let controller1 :GoodsViewController = GoodsViewController(nibName: "GoodsViewController", bundle: nil)
        controller1.title = "FOODS"
        controllerArray.append(controller1)
        
        let controller2 :GoodsViewController = GoodsViewController(nibName: "GoodsViewController", bundle: nil)
        controller2.title = "DRINK"
        controllerArray.append(controller2)
        
        let controller3 :GoodsViewController = GoodsViewController(nibName: "GoodsViewController", bundle: nil)
        controller3.title = "GROCERY"
        controllerArray.append(controller3)
        
        
        let parameters: [CAPSPageMenuOption] = [
            .ScrollMenuBackgroundColor(UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)),
            .ViewBackgroundColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 1.0)),
            .SelectionIndicatorColor(UIColor.orangeColor()),
            .BottomMenuHairlineColor(UIColor(red: 70.0/255.0, green: 70.0/255.0, blue: 80.0/255.0, alpha: 1.0)),
            .MenuItemFont(UIFont(name: "HelveticaNeue", size: 13.0)!),
            .MenuHeight(80.0),
            .MenuItemWidth(90.0),
            .CenterMenuItems(true)
        ]
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        
        
        self.addChildViewController(pageMenu!)
        self.view.addSubview(pageMenu!.view)
        
        pageMenu!.didMoveToParentViewController(self)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let lightBlue = UIColor(red: 75/255, green: 199/255, blue: 241/255, alpha: 1)
        self.navigationController!.navigationBar.barTintColor = lightBlue
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont(name: "Chalkduster", size: 25)!]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

