//
//  GoodsCollectionView.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/16.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit


class GoodsCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    let cellMargin: CGFloat = 5.0
    var goodsArray: [Goods]?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.delegate = self
        self.dataSource = self
        
        //register class
        self.registerClass(GoodsCollectionViewCell.self, forCellWithReuseIdentifier: "GoodsCollectionViewCell")
        
        setCollectionView()
        
        // reloadCollectionView
        reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func setCollectionView() {
        self.backgroundColor = UIColor.lightGrey()
    }
    
    // collectionView setting
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.goodsArray?.count)!
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("GoodsCollectionViewCell", forIndexPath: indexPath) as! GoodsCollectionViewCell
        cell.backgroundColor = UIColor.whiteColor()
        let goods = self.goodsArray![indexPath.item]
        
        cell.goodsNumberLabel.text = String(goods.stockNum)
        cell.unitLabel.text = goods.countingType
        cell.goodsImageView.image = cell.diplayImageView(goods.image!)
        //        cell.plusButton.addTarget(self, action: "plusBtnTapped:", forControlEvents: .TouchUpInside)
//        cell.minusButton.addTarget(self, action: "minusBtnTapped:", forControlEvents: .TouchUpInside)
        return cell
    }
    

//    //Gesture
//    func plusBtnTapped(sender: UIButton) {
//        goodsNumber += 1
//        self.reloadData()
//    }
//    
//    
//    func minusBtnTapped(sender: UIButton) {
//        goodsNumber -= 1
//        self.reloadData()
//    }

}
