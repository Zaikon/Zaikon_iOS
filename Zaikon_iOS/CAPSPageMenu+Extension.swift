//
//  PageMenu+Extension.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/18.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit

class CustomPageMenu: CAPSPageMenu {
    var pageMenu : CustomPageMenu?
    
    class func makePageMenu(ViewController: UIViewController) -> CustomPageMenu? {
        let navBarHeight = ViewController.navigationController?.navigationBar.frame.size.height
        let statusBarHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.height
        
        let arrayNum = controllerArray.count
        let menuWidth = ViewController.view.frame.width / CGFloat(arrayNum)
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
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, CGFloat(navBarHeight!) + statusBarHeight, ViewController.view.frame.width, ViewController.view.frame.height), pageMenuOptions: parameters)
        return pageMenu
    }
}
