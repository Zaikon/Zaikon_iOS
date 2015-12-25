//
//  goodsEditViewController.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/25.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit

class GoodsEditViewController: UIViewController {
    var goods: Goods!
    var goodsEditView: GoodsEditView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        goodsEditView = GoodsEditView.instance()
        goodsEditView.frame = self.view.frame
        goodsEditView.goods = goods
        
        goodsEditView.updateButton.addTarget(self, action: "tapUpadteButton:", forControlEvents: .TouchUpInside)
        self.view.addSubview(goodsEditView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title  = goods.name
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont(name: "Avenir-Heavy", size: 20)!]
    }
    
    func tapUpadteButton(sender: UIButton) {
        goodsEditView.updateGoodsAttributes()
        goodsEditView.goods.update() { (goods) -> Void in
            self.goods = goods
            let viewController = GoodsDetailViewController()
            viewController.goods = goods
        }
    }


}
