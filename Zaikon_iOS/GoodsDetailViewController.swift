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
        goodsDetailView.addBorderEffect()
        goodsDetailView.addScollViewEffect()
        goodsDetailView.insertGoodsInftormation(goods)
        self.view.addSubview(goodsDetailView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        self.navigationItem.title = "ザイコン"
        self.navigationController?.navigationBar.translucent = false
    }
}
