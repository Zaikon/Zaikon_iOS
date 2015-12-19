//
//  goodsViewController.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/16.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit

class GoodsCollectionViewController: UIViewController, GoodsCollectionViewDelegate {
    var goodsArray: [Goods]?
    var currentSelectedGoods: Goods?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGoodsCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setGoodsCollectionView() {
        let cellWidth = self.view.frame.size.width / 2 - 2
        
        // collectionView setting
        let frame = self.view.frame
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(cellWidth, cellWidth * 5 / 4)
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        
        let goodsCollectionView = GoodsCollectionView(frame: frame, collectionViewLayout: layout)
        goodsCollectionView.customDelefgate = self
        goodsCollectionView.goodsArray = goodsArray
        self.view.addSubview(goodsCollectionView)
    }
    
    func didselectCollectionViewCell(goods: Goods) {
//        let goodsDetailViewController: GoodsDetailViewController = GoodsDetailViewController()
//        goodsDetailViewController.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
//        goodsDetailViewController.goods = goods
//        print(goodsDetailViewController.goods)
//        
//        
//        print("+++++++++++++++++++++++++++++++")
        
        
//        self.presentViewController(goodsDetailViewController, animated: true, completion: nil)
//        print(self.navigationController)
//        self.presentViewController(goodsDetailViewController, animated: true, completion: nil)
//        self.presentViewController(goodsDetailViewController, animated: true)
        
        self.currentSelectedGoods = goods
        performSegueWithIdentifier("ShowDetailViewController", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let goodsDetailViewController = segue.destinationViewController as! GoodsDetailViewController
        goodsDetailViewController.goods = currentSelectedGoods
    }
}
