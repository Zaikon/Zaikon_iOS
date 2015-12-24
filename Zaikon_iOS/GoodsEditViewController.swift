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
    var goodsEditView: GoodsEditView

    override func viewDidLoad() {
        super.viewDidLoad()
        
        goodsEditView = GoodsEditView.instance()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
        
    }


}
