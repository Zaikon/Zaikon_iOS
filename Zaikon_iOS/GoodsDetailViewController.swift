//
//  GoodsDetailViewController.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/18.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit

class GoodsDetailViewController: UIViewController {
    var goodsDetailView: GoodsDetailView!
    var goods: Goods!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        goodsDetailView = GoodsDetailView.instance()
        goodsDetailView.frame = self.view.frame
        goodsDetailView.settingButton.addTarget(self, action: "settingBtnTapped:", forControlEvents: .TouchUpInside)
        goodsDetailView.addBorderEffect()
        goodsDetailView.goods = goods
        goodsDetailView.insertGoodsInftormation(goods)
        self.view.addSubview(goodsDetailView)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        let backButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        navigationItem.title  = goods.name
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationItem.backBarButtonItem = backButtonItem
        navigationController?.navigationBar.translucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont(name: "Avenir-Heavy", size: 20)!]
    }
    
    func settingBtnTapped(sender: UIButton) {
        let alertController = UIAlertController(title: "Setting Option", message: nil, preferredStyle: .ActionSheet)
        let editAction = UIAlertAction(title: "Edit", style: .Default) { (action: UIAlertAction!) -> Void in
            self.performSegueWithIdentifier("ShowGoodsEditViewController", sender: self)
        }
        let deleteAction = UIAlertAction(title: "Delete", style: .Destructive) { (action: UIAlertAction!) -> Void in
            print("delete")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alertController.addAction(editAction)
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let goodsEditViewController = segue.destinationViewController as! GoodsEditViewController
        goodsEditViewController.goods = self.goods
        goodsEditViewController.parentViewController?.reloadInputViews()
    }
}
